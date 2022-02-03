*** Settings ***
Documentation     A resource for global
Library           SeleniumLibrary      10        run_on_failure=Capture Page Screenshot
Library           String
Library           BuiltIn

*** Variable ***
${BROWSER}                  chrome
${URL}                      sehatq.com
${EMAIL LOGIN}              dhekapektoy@gmail.com
${PASSWORD LOGIN}           Vimmal14
${NAME}                     pras
${DOB}                      05 Juli 1992
${GENDER}                   Laki-laki
${PHONE}                    6281220172375
${ADDRESS}                  bandung
${HEIGHT}                   170
${WEIGHT}                   60

*** Keywords ***
Launch Mobile Browser
    [Arguments]     ${deviceName}       ${url}
    ${mobile emulation}=    Create Dictionary    deviceName=${deviceName}
    ${chrome_options} =     Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method             ${chrome_options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    Open Browser    ${url}    browser=${BROWSER}     desired_capabilities=${options}