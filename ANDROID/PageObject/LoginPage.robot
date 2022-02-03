*** Settings ***
Library           AppiumLibrary

*** Variable ***
${loginImg}             xpath=//*[contains(@resource-id,"iv_login")]
${fieldEmail}           xpath=//*[contains(@resource-id, "tf_email")]//*[contains(@resource-id, "et_input")]
${fieldPassword}        xpath=//*[contains(@resource-id, "tf_password")]//*[contains(@resource-id, "et_input")]
${submitButton}         xpath=//*[contains(@resource-id, "btn_login")]
${invalidEmailText}     xpath=//*[@text="Masukkan email yang valid"]
${successLoginText}     xpath=//*[@text="Profil Saya"]
${unregisteredEmail}    xpath=//*[@text="Email harus diisi dengan benar"]
${lessPasswordText}     xpath=//*[@text="Password minimal 6 karakter"]
${wrongPasswordText}    xpath=//*[@text="Email atau Password yang Anda masukkan salah"]

*** Keywords ***
user can see login screen page element
    Wait Until Element Is Visible         ${loginImg}
    run keyword and continue on failure   Element Should Be Visible    ${fieldEmail}
    run keyword and continue on failure   Element Should Be Visible    ${fieldPassword}
    run keyword and continue on failure   Element Should Be Visible    ${submitButton}

user input email value
    [arguments]    ${email}
    Wait Until Element Is Visible         ${fieldEmail}
    Input Text                            ${fieldEmail}        ${email}

user input password value
    [arguments]    ${password}
    Wait Until Element Is Visible         ${fieldPassword}
    Input Text                            ${fieldPassword}      ${password}

user tap login button
    Wait Until Element Is Visible         ${submitButton}
    Click Element                         ${submitButton}

user can see validation login
    [arguments]    ${validation}
    Run Keyword IF          '${validation}' == 'empty all'           user can see empty field message
    ...    ELSE IF          '${validation}' == 'invalid password'    user can see error password is invalid
    ...    ELSE IF          '${validation}' == 'less password'       user can see error less password
    ...    ELSE IF          '${validation}' == 'login success'       user can see login success
    ...    ELSE IF          '${validation}' == 'unregister user'     user can see error email not registered
    ...    ELSE                                                      user can see error email is invalid

user can see empty field message
    Wait Until Element Is Visible         ${invalidEmailText}
    Element Should Be Visible             ${lessPasswordText}

user can see error email is invalid
    Wait Until Element Is Visible         ${invalidEmailText}
    Element Should Be Visible             ${invalidEmailText}

user can see error password is invalid
    Wait Until Element Is Visible         ${wrongPasswordText}
    Element Should Be Visible             ${wrongPasswordText}

user can see error email not registered
    Wait Until Element Is Visible         ${unregisteredEmail}
    Element Should Be Visible             ${unregisteredEmail}

user can see error less password
    Wait Until Element Is Visible         ${lessPasswordText}
    Element Should Be Visible             ${lessPasswordText}

user can see login success
    Wait Until Element Is Visible         ${successLoginText}
    Element Should Be Visible             ${successLoginText}
