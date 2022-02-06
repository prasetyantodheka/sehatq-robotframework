*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://sehatq.com/
${BROWSER}        chrome
${EMAIL}          yourmail@mail.com
${PASSWORD}       yourpassword
${SEHATQ LOGO}    xpath=//img[@alt="SehatQ"]

*** Test Cases ***
[TC-001]-Launching the browser and try login
    Launch Browser              Pixel 2
    Goto login menu
    input email and password with correct value

*** Keywords ***
Launch Browser
    [Arguments]     ${deviceName}
    ${mobile emulation}=    Create Dictionary    deviceName=${deviceName}
    ${chrome_options} =     Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method             ${chrome_options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    ${options}=     Call Method     ${chrome_options}    to_capabilities

    Open Browser    ${URL}    browser=${BROWSER}     desired_capabilities=${options}

Goto login menu
    Element Should Be Visible              ${SEHATQ LOGO}
    Sleep                                  3
    Wait Until Element Is Visible          xpath=//*[@alt="Login"]
    Click Element                          xpath=//*[@alt="Login"]

input email and password with correct value
    Wait Until Element Is Visible    id=email
    Input Text                       id=email         ${EMAIL}
    Wait Until Element Is Visible    name=password
    Input Text                       name=password      ${PASSWORD}
    Click Element                    xpath=//button[@type="submit"]
    Sleep                            20

