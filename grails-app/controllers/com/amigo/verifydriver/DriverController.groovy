package com.amigo.verifydriver



import static com.amigo.verifydriver.Constants.*
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import org.grails.plugin.filterpane.FilterPaneUtils

import com.amigo.verifydriver.util.ExportDetails
import com.amigo.verifydriver.util.ImageUtil

@Transactional(readOnly = true)
class DriverController {

	static allowedMethods = [save: "POST", update: "POST", verify: "POST", delete: "POST"]
	def springSecurityService
	def exportService
	def grailsApplication  //inject GrailsApplication
	def filterPaneService
	static byte [] unknownPersonPhoto = new ImageUtil().extractBytesFromImageInClasspath("unknown-person.gif")

	static {

	}

	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def index(Integer max) {
		println "inside index, the max is:${max}"
		if(!params.max) params.max = PAGE_SIZE
		def status = Status.DETAILS_CAPTURED.name()

		if(params?.expFormat && params.expFormat != "html"){
			println "format is: ${params.expFormat}"
			def fileName = getFileName("UnverifiedDrivers")
			def exportDetails = formatColumnsForExport(fileName)
			exportService.export(params.expFormat, response.outputStream,Driver.findAllByStatus(status),
					exportDetails.fields, exportDetails.labels, exportDetails.formatters, exportDetails.parameters)
		} else

			respond Driver.findAllByStatus(status,[max: params.max,offset:params.offset]), model:[driverInstanceCount: Driver.count()]

	}

	private def filter(Status status) {
		if(!params.max) params.max = PAGE_SIZE
		params["filter.status"] = status
		params["filter.op.status"] = "InList"
		println "inside filter:${params}"
		render( view:'index', model:[ driverInstanceList: filterPaneService.filter( params, Driver ),
			driverInstanceCount: filterPaneService.count( params, Driver ),
			filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def filterUnverified() {
		filter(Status.DETAILS_CAPTURED)

	}

	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def filterVerified() {
		filter(Status.VERIFIED)
	}

	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def filterRejected() {
		filter(Status.REJECTED)
	}
	
	def search() {
		render( view:'search', model:[ driverInstanceList: filterPaneService.filter( params, Driver ),
			driverInstanceCount: filterPaneService.count( params, Driver ),
			filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )	
	}

	@Secured([
		'ROLE_VERIFIER',
		'ROLE_USER',
		'ROLE_EXT_USER'
	])
	def verified (Integer max) {
		def maxNum = PAGE_SIZE
		if(max != null)
			maxNum = max
		def status = Status.VERIFIED.name()
		if(params?.expFormat && params.expFormat != "html"){
			println "format is: ${params.expFormat}"
			def fileName = getFileName("VerifiedDrivers")
			def exportDetails = formatColumnsForExport(fileName)
			exportService.export(params.expFormat, response.outputStream,Driver.findAllByStatus(status),
					exportDetails.fields, exportDetails.labels, exportDetails.formatters, exportDetails.parameters)
		} else
			respond Driver.findAllByStatus(status,[max: params.max,offset:params.offset]), model:[driverInstanceCount: Driver.count()]
	}

	def formatColumnsForExport(String fileName){
		response.contentType = grailsApplication.config.grails.mime.types[params.expFormat]
		response.setHeader("Content-disposition", "attachment; filename=${fileName}.${params.extension}")
		List fields = [
			"name",
			"fatherName",
			"drivingLicenseNumber",
			"licensePlaceOfIssue"
		]
		Map labels = ["name":"Name", "fatherName": "Father Name", "drivingLicenseNumber": "Driving License Number", "licensePlaceOfIssue":"Issue Place of License"]
		// Formatter closure
		def upperCase = { domain, value ->
			return value.toUpperCase()
		}

		Map formatters = [author: upperCase]
		Map parameters = [title: fileName, "column.widths": [0.25, 0.25, 0.25, 0.25]]
		return new ExportDetails(fields, labels, formatters, parameters)
	}

	def getFileName(String fileName){
		fileName + "-"+ new Date().format("dMMMyyyy-HH-mm")
	}

	@Transactional
	@Secured(['ROLE_VERIFIER'])
	def verify (Driver driverInstance) {
		if (driverInstance == null) {
			notFound()
			return
		}

		driverInstance.status = Status.VERIFIED.name()
		setVerificationDetails(driverInstance)
		driverInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.verified.message', args: [
					message(code: 'Driver.label', default: 'Driver'),
					driverInstance.id
				])
				redirect action:"verified", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}


	@Transactional
	@Secured(['ROLE_VERIFIER'])
	def reject (Driver driverInstance) {
		if (driverInstance == null) {
			notFound()
			return
		}

		driverInstance.status = Status.REJECTED.name()
		setVerificationDetails(driverInstance)
		driverInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.rejected.message', args: [
					message(code: 'Driver.label', default: 'Driver'),
					driverInstance.id
				])
				redirect action:"rejected", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def rejected (Integer max) {
		if(!params.max) params.max = PAGE_SIZE

		def status = Status.REJECTED.name()
		if(params?.expFormat && params.expFormat != "html"){
			println "format is: ${params.expFormat}"
			def fileName = getFileName("RejectedDrivers")
			def exportDetails = formatColumnsForExport(fileName)
			exportService.export(params.expFormat, response.outputStream,Driver.findAllByStatus(status),
					exportDetails.fields, exportDetails.labels, exportDetails.formatters, exportDetails.parameters)
		} else
			respond Driver.findAllByStatus(status,[max: params.max,offset:params.offset]), model:[driverInstanceCount: Driver.count()]
	}

	@Transactional
	@Secured(['ROLE_USER'])
	def adddetails (DriverDetailsFromCitizen driverDetails) {
		def id = params.long('driverDetailsFromCitizenId')

		def driverDetailsFromCitizen = DriverDetailsFromCitizen.get(id)

		def driver = new Driver()
		driver.name = driverDetailsFromCitizen.driverName
		driver.drivingLicenseNumber = driverDetailsFromCitizen.drivingLicenseNumber
		driver.photo = driverDetailsFromCitizen.photo
		driver.photoType = driverDetailsFromCitizen.photoType
		driver.mobileNumber = driverDetailsFromCitizen.driverPhoneNumber
		render(view:"edit", model:[driverInstance:driver, driverDetailsFromCitizenId:id])
	}

	private def setVerificationDetails(Driver driverInstance){
		def auth = springSecurityService.authentication
		driverInstance.verifiedBy = auth.name
		driverInstance.verifiedDate = new Date()
		driverInstance.lastUpdatedBy = auth.name
		driverInstance.lastUpdatedDate = new Date()
	}

	@Secured([
		'ROLE_VERIFIER',
		'ROLE_USER',
		'ROLE_EXT_USER'
	])
	def show(Driver driverInstance) {
		respond driverInstance
	}

	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def create() {
		println "create ${params}"
		respond new Driver(params)
	}

	@Transactional
	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def save(Driver driverInstance) {
		if (driverInstance == null) {
			notFound()
			return
		}
		setCreationDetails(driverInstance)
		setPhotoDetails(request, driverInstance)

		if (driverInstance.hasErrors()) {
			respond driverInstance.errors, view:'create'
			return
		}

		driverInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'driver.label', default: 'Driver'),
					driverInstance.id
				])
				redirect driverInstance
			}
			'*' { respond driverInstance, [status: CREATED] }
		}
	}

	private def setPhotoDetails(javax.servlet.http.HttpServletRequest request, Driver driverInstance) {
		def f = request.getFile('photo')
		driverInstance.photo = f.bytes
		driverInstance.photoType = f.contentType

		def f2 = request.getFile('referral.referralPhoto')
		if(f2){
			driverInstance.referral.referralPhoto = f2.bytes
			driverInstance.referral.referralPhotoType = f2.contentType
		}
	}

	private def setCreationDetails(Driver driverInstance){
		def auth = springSecurityService.authentication
		driverInstance.createdBy = auth.name
		driverInstance.createdDate = new Date()
		driverInstance.lastUpdatedBy = auth.name
		driverInstance.lastUpdatedDate = new Date()
	}

	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def avatar_image() {
		def avatarUser = Driver.get(params.id)
		if (!avatarUser || !avatarUser.photo || !avatarUser.photoType) {
			response.contentType = "image/gif"
			response.contentLength = unknownPersonPhoto.size()
			OutputStream out = response.outputStream
			out.write(unknownPersonPhoto)
			out.close()
			return
		}
		response.contentType = avatarUser.photoType
		response.contentLength = avatarUser.photo.size()
		OutputStream out = response.outputStream
		out.write(avatarUser.photo)
		out.close()
	}

	@Secured([
		'ROLE_VERIFIER',
		'ROLE_USER',
		'ROLE_EXT_USER'
	])
	def avatar_image2() {
		def avatarUser = Driver.get(params.id)
		if (!avatarUser || !avatarUser.referral.referralPhoto || !avatarUser.referral.referralPhotoType) {
			response.contentType = "image/gif"
			response.contentLength = unknownPersonPhoto.size()
			OutputStream out = response.outputStream
			out.write(unknownPersonPhoto)
			out.close()
			return
		}
		response.contentType = avatarUser.referral.referralPhotoType
		response.contentLength = avatarUser.referral.referralPhoto.size()
		OutputStream out = response.outputStream
		out.write(avatarUser.referral.referralPhoto)
		out.close()
	}


	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def edit(Driver driverInstance) {
		respond driverInstance
	}

	@Transactional
	@Secured(['ROLE_VERIFIER', 'ROLE_USER'])
	def update(Driver driverInstance) {
		if (driverInstance == null) {
			notFound()
			return
		}

		setUpdationDetails(driverInstance)

		def driverDetailsFromCitizenId = params.long('driverDetailsFromCitizenId')

		setPhotoDetails(request, driverInstance)

		if (driverInstance.hasErrors()) {
			respond driverInstance.errors, view:'edit'
			return
		}

		driverInstance.save flush:true

		if(driverDetailsFromCitizenId > 0){
			def driverDetails = DriverDetailsFromCitizen.get(driverDetailsFromCitizenId)
			driverDetails.status = Status.DETAILS_CAPTURED
			driverDetails.save flash:true
		}

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Driver.label', default: 'Driver'),
					driverInstance.id
				])
				redirect driverInstance
			}
			'*'{ respond driverInstance, [status: OK] }
		}
	}

	private def setUpdationDetails(Driver driverInstance){
		def auth = springSecurityService.authentication
		driverInstance.lastUpdatedBy = auth.name
		driverInstance.lastUpdatedDate = new Date()
	}

	@Transactional
	@Secured(['ROLE_VERIFIER'])
	def delete(Driver driverInstance) {

		if (driverInstance == null) {
			notFound()
			return
		}

		setUpdationDetails(driverInstance)

		driverInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Driver.label', default: 'Driver'),
					driverInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'driver.label', default: 'Driver'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
