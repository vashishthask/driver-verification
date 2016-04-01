class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

//        "/"(view:"/index")
//		"/"(controller: "login", action: "auth")
		"/"(controller: "driverDetailsFromCitizen", action: "create")
        "500"(view:'/error')
	}
}
