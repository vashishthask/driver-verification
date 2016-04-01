package com.amigo.verifydriver.taglib

class LoginToggleTagLib {
    def springSecurityService
    def loginToggle = {

        out << "<div>"

        if (session.getAttribute("SPRING_SECURITY_CONTEXT")){
            out << "<table border='0' width='100%'><tr>"
            out << "<td witdh='80%'>Welcome ${springSecurityService.authentication.name}.</td>"
            out << "<td witdh='20%'>"
            out << "<a href='${createLink(controller:'logout', action:'index')}'>Logout </a>"
            out << "</td>"
			out << "</tr></table>"
        } else {
            out << "<span>"
            out << "<a href='${createLink(controller:'login', action:'auth')}'>"
            out << "Login </a></span>"
        }

        out << "</div>"
    }
}
