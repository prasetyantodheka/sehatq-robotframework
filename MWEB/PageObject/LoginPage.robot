*** Variable ***
${loginImg}             xpath=//img[@alt="Login in SehatQ"]
${fieldEmail}           id=email
${fieldPassword}        name=password
${submitButton}         xpath=//button[@type="submit"]
${emptyEmailText}       xpath=//*[text()="Alamat Email wajib diisi"]
${emptyPasswordText}    xpath=//*[text()="Password wajib diisi"]
${invalidEmailText}     xpath=//*[text()="Email harus diisi dengan benar"]
${successLoginText}     xpath=//*[text()="Login Berhasil"]
${wrongPasswordText}    xpath=//*[text()="Email atau Password yang Anda masukkan salah"]
${lessPasswordText}     xpath=//*[text()="Kolom Password minimal 6"]

*** Keywords ***
user at login screen
    go to           https://${URL}/login
    Maximize Browser Window
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
    ...    ELSE                                                      user can see error email is invalid

user can see empty field message
    Wait Until Element Is Visible         ${emptyEmailText}
    Element Should Be Visible             ${emptyPasswordText}

user can see error email is invalid
    Wait Until Element Is Visible         ${invalidEmailText}
    Element Should Be Visible             ${invalidEmailText}

user can see error password is invalid
    Wait Until Element Is Visible         ${wrongPasswordText}
    Element Should Be Visible             ${wrongPasswordText}

user can see error less password
    Wait Until Element Is Visible         ${lessPasswordText}
    Element Should Be Visible             ${lessPasswordText}

user can see login success
    Sleep                                   5
    ${url}=                               Get Location
    Should Be Equal                       ${url}                ${URL}

