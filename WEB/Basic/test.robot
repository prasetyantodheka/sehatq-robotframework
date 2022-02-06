*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://sehatq.com/
${BROWSER}        firefox
${EMAIL}          yourmail@mail.com
${PASSWORD}       yourpassword
${SEHATQ LOGO}    xpath=//img[@alt="SehatQ"]

*** Test Cases ***
[TC-001]-Launching the browser and try login
    Launch Browser
    Goto login menu
    input email and password with correct value

*** Keywords ***
Launch Browser
    Open Browser                     ${URL}         ${BROWSER}
    Maximize Browser Window

Goto login menu
    Element Should Be Visible              ${SEHATQ LOGO}
    Sleep                                  3
    Wait Until Element Is Visible          xpath=//*[@alt="SehatQ Profile"]
    Click Element                          xpath=//*[@alt="SehatQ Profile"]

input email and password with correct value
    Wait Until Element Is Visible    id=email
    Input Text                       id=email         ${EMAIL}
    Wait Until Element Is Visible    name=password
    Input Text                       name=password      ${PASSWORD}
    Click Element                    xpath=//button[@type="submit"]
    Sleep                            20

