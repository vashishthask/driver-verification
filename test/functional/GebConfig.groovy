/*
 This is the Geb configuration file.
 See: http://www.gebish.org/manual/current/configuration.html
 */

import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.firefox.FirefoxProfile


driver = {
	FirefoxProfile profile = new FirefoxProfile()
	profile.setPreference("intl.accept_languages", "en-us")
	def driverInstance = new FirefoxDriver(profile)
	driverInstance.manage().window().maximize()
	driverInstance
}

baseNavigatorWaiting = true
atCheckWaiting = true