package pages.driver

import pages.ScaffoldPage

class CreatePage extends ScaffoldPage {
	static at = {
		title ==~ /Create.+/
	}
	
	static content = {
		createButton(to: ShowPage) { create() }
	}
}
