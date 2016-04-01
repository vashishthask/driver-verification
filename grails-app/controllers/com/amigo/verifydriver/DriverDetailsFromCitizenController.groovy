package com.amigo.verifydriver



import static org.springframework.http.HttpStatus.*
import static com.amigo.verifydriver.Constants.*
import grails.transaction.Transactional

import com.amigo.verifydriver.util.ExportDetails
import com.amigo.verifydriver.util.ImageUtil

@Transactional(readOnly = true)
class DriverDetailsFromCitizenController {

	static allowedMethods = [save: "POST", update: ["PUT", "POST"], delete: "DELETE"]
	static byte [] unknownPersonPhoto = new ImageUtil().extractBytesFromImageInClasspath("unknown-person.gif")
	def exportService
	def grailsApplication  //inject GrailsApplication
	def simpleCaptchaService


	def index(Integer max) {
		if(!params.max) params.max = PAGE_SIZE
		
		if(params?.expFormat && params.expFormat != "html"){
			println "format is: ${params.expFormat}"
			def exportDetails = formatColumnsForExport()
			exportService.export(params.expFormat, response.outputStream,
				DriverDetailsFromCitizen.findAllByStatus(Status.DETAILS_REPORTED.name()), 
				exportDetails.fields, exportDetails.labels, exportDetails.formatters, exportDetails.parameters)
		} else {
			respond DriverDetailsFromCitizen.findAllByStatus(Status.DETAILS_REPORTED.name(),[max: params.max,offset:params.offset]), 
				model:[driverDetailsFromCitizenInstanceCount: DriverDetailsFromCitizen.count()]
		}
	}
	
	
	def formatColumnsForExport(){
		response.contentType = grailsApplication.config.grails.mime.types[params.expFormat]
		def fileName = getFileName("DriversAddedByCitizens")
		response.setHeader("Content-disposition", "attachment; filename=${fileName}.${params.extension}")
		List fields = ["createdBy","drivingLicenseNumber", "driverName", "driverPhoneNumber", "remarks"]
		Map labels = ["createdBy":"Citizen Phone Number", "drivingLicenseNumber": "Driving License Number", "driverName": "Driver Name", "driverPhoneNumber":"Driver Phone Number", "remarks":"Remarks"]
		// Formatter closure
		def upperCase = { domain, value ->
			return value.toUpperCase()
		}

		Map formatters = [author: upperCase]
		Map parameters = [title: "Drivers Added By Citizens", "column.widths": [0.20, 0.20, 0.20, 0.20, 0.20]]
		return new ExportDetails(fields, labels, formatters, parameters)
	}
	
	def getFileName(String fileName){
		fileName + "-"+ new Date().format("dMMMyyyy-HH-mm")
	}
	

	def citizenindex(Integer max) {
		if(!params.max) params.max = PAGE_SIZE
		if(params?.expFormat && params.expFormat != "html"){
			println "format is: ${params.expFormat}"
			def exportDetails = formatColumnsForExport()
			response.contentType = grailsApplication.config.grails.mime.types[params.expFormat]
			response.setHeader("Content-disposition", "attachment; filename=DriversAddedByCitizens.${params.extension}")
			exportService.export(params.expFormat, response.outputStream,DriverDetailsFromCitizen.findAllByCreatedBy(auth.name), 
				exportDetails.fields, exportDetails.labels, exportDetails.formatters, exportDetails.parameters)
		} else
			respond DriverDetailsFromCitizen.findAllByCreatedBy(auth.name,[max: params.max,offset:params.offset]), model:[driverDetailsFromCitizenInstanceCount: DriverDetailsFromCitizen.count()], view: 'index'
	}

	def show(DriverDetailsFromCitizen driverDetailsFromCitizenInstance) {
		respond driverDetailsFromCitizenInstance
	}

	def create() {
		respond new DriverDetailsFromCitizen(params)
	}

	@Transactional
	def save(DriverDetailsFromCitizen driverDetailsFromCitizenInstance) {
		if (driverDetailsFromCitizenInstance == null) {
			notFound()
			return
		}
		
		boolean captchaValid = examineCaptchaDetails(request)
		if (!captchaValid){
			driverDetailsFromCitizenInstance.errors.reject("default.invalid.captcha.message","The text you entered didn't match with given in image. Please try again.")
			respond driverDetailsFromCitizenInstance.errors, view:'create'
			return
		}

		setPhotoDetails(request, driverDetailsFromCitizenInstance)
		setCreationDetails(driverDetailsFromCitizenInstance)

		if (driverDetailsFromCitizenInstance.hasErrors()) {
			respond driverDetailsFromCitizenInstance.errors, view:'create'
			return
		}

		driverDetailsFromCitizenInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'driverDetailsFromCitizen.label', default: 'DriverDetailsFromCitizen'),
					driverDetailsFromCitizenInstance.id
				])
				redirect driverDetailsFromCitizenInstance
			}
			'*' { respond driverDetailsFromCitizenInstance, [status: CREATED] }
		}
	}
	
	private def examineCaptchaDetails(javax.servlet.http.HttpServletRequest request){
		String captcha = request.getParameter(Constants.CAPTCHA)
		return simpleCaptchaService.validateCaptcha(captcha)
	}

	def avatar_image() {
		def avatarUser = DriverDetailsFromCitizen.get(params.id)

		if (!avatarUser || !avatarUser.photo || !avatarUser.photoType) {
			response.contentType = "image/gif"
			response.contentLength = unknownPersonPhoto.size()
			OutputStream out = response.outputStream
			out.write(unknownPersonPhoto)
			out.close()
			return
		}
		def contentLength = avatarUser.photo.size()
		response.contentType = avatarUser.photoType
		response.contentLength = avatarUser.photo.size()
		OutputStream out = response.outputStream
		out.write(avatarUser.photo)
		out.close()
	}

	private def setCreationDetails(DriverDetailsFromCitizen driverInstance){
		driverInstance.createdDate = new Date()
		driverInstance.lastUpdatedBy = driverInstance.createdBy
		driverInstance.lastUpdatedDate = new Date()
	}

	private def setUpdationDetails(DriverDetailsFromCitizen driverInstance){
		driverInstance.lastUpdatedDate = new Date()
	}

	private def setPhotoDetails(javax.servlet.http.HttpServletRequest request, DriverDetailsFromCitizen driverInstance) {
		def f = request.getFile('photo')
		driverInstance.photo = f.bytes
		driverInstance.photoType = f.contentType
	}

	def edit(DriverDetailsFromCitizen driverDetailsFromCitizenInstance) {
		respond driverDetailsFromCitizenInstance
	}

	@Transactional
	def update(DriverDetailsFromCitizen driverDetailsFromCitizenInstance) {
		if (driverDetailsFromCitizenInstance == null) {
			notFound()
			return
		}

		setUpdationDetails(driverDetailsFromCitizenInstance)
		setPhotoDetails(request, driverDetailsFromCitizenInstance)
		if (driverDetailsFromCitizenInstance.hasErrors()) {
			respond driverDetailsFromCitizenInstance.errors, view:'edit'
			return
		}


		driverDetailsFromCitizenInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'DriverDetailsFromCitizen.label', default: 'DriverDetailsFromCitizen'),
					driverDetailsFromCitizenInstance.id
				])
				redirect driverDetailsFromCitizenInstance
			}
			'*'{ respond driverDetailsFromCitizenInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(DriverDetailsFromCitizen driverDetailsFromCitizenInstance) {

		if (driverDetailsFromCitizenInstance == null) {
			notFound()
			return
		}

		driverDetailsFromCitizenInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'DriverDetailsFromCitizen.label', default: 'DriverDetailsFromCitizen'),
					driverDetailsFromCitizenInstance.id
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
					message(code: 'driverDetailsFromCitizen.label', default: 'DriverDetailsFromCitizen'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
	
}
