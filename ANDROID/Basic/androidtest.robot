*** Settings ***
Library     AppiumLibrary

*** Test Case ***
test android
	Start Application on Local
	Goto Login menu
	input email and password with correct value


*** Keywords ***
Start Application on Local
    Open Application    http://127.0.0.1:4723/wd/hub
    ...     platformName=android    platformVersion=11
    ...     app=C:\\Users\\Gery\\Documents\\sehatq\\Automations\\ANDROID\\Basic\\app-debug-feature_rizky_ANDRO-297-2720.apk      appPackage=com.she.sehatq.debug      appActivity=com.she.sehatq.view.intro.SplashActivity
    ...     newCommandTimeout=2500      noReset=true      autoGrantPermissions=true
    ...     unicodeKeyboard=true        resetKeyboard=true      automationName=uiautomator2     dontStopAppOnReset=true     adbExecTimeout=60000

Goto Login menu
	Wait Until Element Is Visible 		xpath=//*[@text="Konsultasi di Manapun, Kapanpun"]
	Swipe By Percent 					90	50	10	50
	Wait Until Element Is Visible 		xpath=//*[@text="Booking Dokter Tanpa Ribet"]
	Swipe By Percent 					90	50	10	50
	Wait Until Element Is Visible 		xpath=//*[@text="Mudahnya Beli Produk Kesehatan"]
	Element Should Be Visible 			xpath=//*[contains(@resource-id, "tvNext")]
	Click Element 						xpath=//*[contains(@resource-id, "tvNext")]
	Run Keyword And Ignore Error 		Click Element 						xpath=//*[contains(@resource-id, "tv_dismiss)]
	Wait Until Element Is Visible 		xpath=//*[@text="Lewati"]
	Click Element 				 		xpath=//*[@text="Lewati"]
	Sleep 								5
	Click Element 						xpath=//*[contains(@resource-id, "iv_profile_nav")]

input email and password with correct value
	Wait Until Element Is Visible 		xpath=//*[contains(@resource-id, "tf_email")]
	Sleep 								3
	Input Text 							xpath=//*[contains(@resource-id, "tf_email")]//*[contains(@resource-id, "et_input")] 			prasetya@mailinator.com
	Input Text 							xpath=//*[contains(@resource-id, "tf_password")]//*[contains(@resource-id, "et_input")] 		sehatq123
	Click Element 						xpath=//*[contains(@resource-id, "btn_login")]
	Wait Until Element Is Visible 		xpath=//*[@text="Profil Saya"] 		timeout=10