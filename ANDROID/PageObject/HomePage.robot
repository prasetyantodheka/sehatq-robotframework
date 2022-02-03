*** Settings ***
Library    AppiumLibrary
*** Variable ***
${nextTutorial}                         xpath=//*[contains(@resource-id, "tvNext")]
${dissmissButton}                       xpath=//*[contains(@resource-id, "tv_dismiss)]
${lewatiTutorial}                       xpath=//*[@text="Lewati"]
${profileMenu}                          xpath=//*[contains(@resource-id, "iv_profile_nav")]
${firstWelcomeText}                     xpath=//*[@text="Konsultasi di Manapun, Kapanpun"]
${sehatqIcon}                           xpath=//*[contains(@resource-id, "imageView30")]

*** Keywords ***

user is on home page
    Start Activity                      appPackage=com.she.sehatq.debug     appActivity=com.she.sehatq.view.intro.SplashActivity
    ${isBegining}                       Run Keyword And Return Status       Wait Until Element Is Visible 		${firstWelcomeText}         timeout=3
    Run Keyword If                      ${isBegining}                       skip welcome page
	${isTutorial}                       Run Keyword And Return Status       Wait Until Element Is Visible 		${lewatiTutorial}         timeout=3
    Run Keyword If                      ${isTutorial}                       skip tutorial
    Wait Until Element Is Visible       ${sehatqIcon}
    Element Should Be Visible           ${profileMenu} 
    

skip welcome page
    Run Keyword And Ignore Error        Wait Until Element Is Visible 		${firstWelcomeText}
	Run Keyword And Ignore Error        Swipe By Percent 					90	50	10	50
	Run Keyword And Ignore Error        Wait Until Element Is Visible 		xpath=//*[@text="Booking Dokter Tanpa Ribet"]
	Run Keyword And Ignore Error        Swipe By Percent 					90	50	10	50
	Run Keyword And Ignore Error        Wait Until Element Is Visible 		xpath=//*[@text="Mudahnya Beli Produk Kesehatan"]
	Run Keyword And Ignore Error        Element Should Be Visible 			${nextTutorial}
	Run Keyword And Ignore Error        Click Element 						${nextTutorial}
	Run Keyword And Ignore Error 		Click Element 						${dissmissButton}

skip tutorial
    Run Keyword And Ignore Error        Wait Until Element Is Visible 		${lewatiTutorial}
	Run Keyword And Ignore Error        Click Element 				 		${lewatiTutorial}
    Sleep 								3

user click profile menu
    Wait Until Element Is Visible 		${profileMenu}
    Click Element 						${profileMenu}