package com.amigo.verifydriver.security

import grails.plugin.springsecurity.SpringSecurityUtils

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler

class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	String userUrl
	String adminUrl
	String extUserUrl
	String loginUrl

	@Override
	protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
		def targetUrl = null

		if(SpringSecurityUtils.ifAllGranted("ROLE_VERIFIER")){
			targetUrl = setTargetUrlForSpecificRole(adminUrl, request)
			println "adminUrl is:${adminUrl}"
		}else if (SpringSecurityUtils.ifAllGranted("ROLE_USER")){
			targetUrl = setTargetUrlForSpecificRole(userUrl, request)
			println "adminUrl is:${userUrl}"
		}else if (SpringSecurityUtils.ifAllGranted("ROLE_EXT_USER")){
			targetUrl = setTargetUrlForSpecificRole(extUserUrl, request)
			println "adminUrl is:${extUserUrl}"
		} else {
			targetUrl = super.determineTargetUrl(request, response)
		}
		targetUrl
	}

	private String setTargetUrlForSpecificRole(String roleBasedUrl, HttpServletRequest request) {
		request.getSession().setAttribute("spring.security.targetUrl", roleBasedUrl)
		return roleBasedUrl
	}
}