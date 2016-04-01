package com.amigo.verifydriver.security
import grails.plugin.springsecurity.annotation.Secured

class SecureController {
	@Secured(['ROLE_VERIFIER'])
    def index() { 
		render 'Secure access only'
	}
}
