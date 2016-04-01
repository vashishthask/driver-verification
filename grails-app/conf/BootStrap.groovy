import com.amigo.verifydriver.security.Role
import com.amigo.verifydriver.security.User
import com.amigo.verifydriver.security.UserRole

class BootStrap {

	def init = { servletContext ->
//		def referral1 = new Referral(name: 'Lallan',phoneNumber: '9200190102', 
//			address: '354  Gali Number 2, Timarpur, Kanpur', relation: 'friend').save(flush: true)
//		def driver1 = new Driver(name: 'Ram Singh',contactNumber: '9200190101',
//		licenseNumber: 'SMZ/SSSA000002',  licenseExpiryDate: new Date(),
//		referral: referral1, address: 's/o Sri Ram Prasad Yadav, Kamboyan, Thana Bhawan, Kanpur',
//		criminalRecord: false, dateOfBirth: new Date(), driverType: 'Personal',
//		fatherName: 'Ram Prasad Yadav').save(flush: true)
		
		def adminRole = new Role(authority: 'ROLE_VERIFIER').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
		def extUserRole = new Role(authority: 'ROLE_EXT_USER').save(flush: true)

		def admin = new User(username: 'admin', password: 'password')
		admin.save(flush: true)
		
		def extUser = new User(username: 'extuser', password: 'password')
		extUser.save(flush: true)
		
		def extUser2 = new User(username: 'extuser2', password: 'password')
		extUser2.save(flush: true)
		
		def user = new User(username: 'user', password: 'password')
		user.save(flush: true)

		UserRole.create admin, adminRole, true
		UserRole.create user, userRole, true
		UserRole.create extUser, extUserRole, true
		UserRole.create extUser2, extUserRole, true

		assert User.count() == 4
		assert Role.count() == 3
		assert UserRole.count() == 4
	}
	def destroy = {
	}
}
