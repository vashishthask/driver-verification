import grails.plugin.springsecurity.SpringSecurityUtils

import com.amigo.verifydriver.security.AuthenticationSuccessHandler


 
beans = {
    authenticationSuccessHandler(AuthenticationSuccessHandler) {
        def conf = SpringSecurityUtils.securityConfig       
        requestCache = ref('requestCache')
        defaultTargetUrl = conf.successHandler.defaultTargetUrl
        alwaysUseDefaultTargetUrl = conf.successHandler.alwaysUseDefault
        targetUrlParameter = conf.successHandler.targetUrlParameter
        useReferer = conf.successHandler.useReferer
        redirectStrategy = ref('redirectStrategy')
        adminUrl = "/driver/index"
        userUrl = "/driver/create"
		extUserUrl = "/driverDetailsFromCitizen/create"
    }
}