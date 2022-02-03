*** Variable ***
${profileKamuText}          xpath=//h2[text()="Profil Kamu"]
${infoProfileText}          xpath=//span[text()="Profil lengkap, akses fitur semakin cepat!"]
${profileImg}               xpath=//img[@alt="Image pras"]
${profileNameValue}         xpath=//span[text()="pras"]
${dobText}                  xpath=//span[text()="Tanggal Lahir"]
${genderText}               xpath=//span[text()="Jenis Kelamin"]
${emailText}                xpath=//span[text()="Email"]
${phoneText}                xpath=//span[text()="No. Telepon"]
${addressText}              xpath=//span[text()="Alamat"]
${ageText}                  xpath=//span[text()="Usia (Thn Bln)"]
${heightText}               xpath=//span[text()="Tinggi (cm)"]
${weightText}               xpath=//span[text()="Berat (kg)"]
${dobValue}                 ${dobText}/../div/span
${genderValue}              ${genderText}/../div/span
${emailValue}               ${emailText}/../div/span
${phoneValue}               ${phoneText}/../div/span
${addressValue}             ${addressText}/../div/span
${heightValue}              ${heightText}/../span[1]
${weightValue}              ${weightText}/../span[1]
${profileUtamaText}         xpath=//span[text()="Profil Utama"]
${editProfileButton}        xpath=//a[text()="Edit Profil"]
${profileEditText}          xpath=//h2[text()="Edit Profil Kamu"]
${selectPhotoButton}        xpath=//button[text()="Pilih Foto"]
${nameField}                name=name
${dobField}                 xpath=//span[text()="Email"]/../input
${genderSelection}          xpath=//div[@id="gender"]//button
${heightField}              name=height
${weightField}              name=weight
${phoneField}               name=phone
${emailField}               xpath=//span[text()="Email"]/../input
${addressField}             name=address
${simpanButton}             xpath=//button[text()="Simpan"]


*** Keywords ***
user can see profile page according with user data
    [arguments]    ${dob}    ${gender}   ${email}   ${phone}   ${address}    ${height}    ${weight}
    Wait Until Element Is Visible         ${profileKamuText}
    run keyword and continue on failure   Element Should Be Visible    ${infoProfileText}
    run keyword and continue on failure   Element Should Be Visible    ${profileImg}
    run keyword and continue on failure   Element Should Be Visible    ${profileNameValue}
    run keyword and continue on failure   Element Should Be Visible    ${dobText}
    run keyword and continue on failure   Element Should Be Visible    ${genderText}
    run keyword and continue on failure   Element Should Be Visible    ${emailText}
    run keyword and continue on failure   Element Should Be Visible    ${phoneText}
    run keyword and continue on failure   Element Should Be Visible    ${addressText}
    run keyword and continue on failure   Element Should Be Visible    ${ageText}
    run keyword and continue on failure   Element Should Be Visible    ${heightText}
    run keyword and continue on failure   Element Should Be Visible    ${weightText}
    run keyword and continue on failure   Element Should Be Visible    ${profileUtamaText}
    run keyword and continue on failure   Element Should Be Visible    ${editProfileButton}
    ${valueDob}                           Get Text                     ${dobValue}
    ${valueGender}                        Get Text                     ${genderValue}
    ${valueEmail}                         Get Text                     ${emailValue}
    ${valuePhone}                         Get Text                     ${phoneValue}
    ${valueAddress}                       Get Text                     ${addressValue}
    ${valueHeight}                        Get Text                     ${heightValue}
    ${valueWeight}                        Get Text                     ${weightValue}
    run keyword and continue on failure   Should Be Equal              ${valueDob}          ${dob}
    run keyword and continue on failure   Should Be Equal              ${valueGender}       ${gender}
    run keyword and continue on failure   Should Be Equal              ${valueEmail}        ${email}
    run keyword and continue on failure   Should Be Equal              ${valuePhone}        ${phone}
    run keyword and continue on failure   Should Be Equal              ${valueAddress}      ${address}
    run keyword and continue on failure   Should Be Equal              ${valueHeight}       ${height}
    run keyword and continue on failure   Should Be Equal              ${valueWeight}       ${weight}

user click edit profile
    Wait Until Element Is Visible         ${editProfileButton}
    Click Element                         ${editProfileButton}

user can see edit profile page
    Wait Until Element Is Visible         ${profileEditText}
    run keyword and continue on failure   Element Should Be Visible    ${infoProfileText}
    run keyword and continue on failure   Element Should Be Visible    ${profileImg}
    run keyword and continue on failure   Element Should Be Visible    ${selectPhotoButton}
    run keyword and continue on failure   Element Should Be Visible    ${nameField}
    run keyword and continue on failure   Element Should Be Visible    ${dobField}
    run keyword and continue on failure   Element Should Be Visible    ${genderSelection}
    run keyword and continue on failure   Element Should Be Visible    ${heightField}
    run keyword and continue on failure   Element Should Be Visible    ${weightField}
    run keyword and continue on failure   Element Should Be Visible    ${phoneField}
    run keyword and continue on failure   Element Should Be Visible    ${emailField}
    run keyword and continue on failure   Element Should Be Visible    ${addressField}
    run keyword and continue on failure   Element Should Be Visible    ${simpanButton}

remove value on textfield
    [arguments]   ${value}      ${field}
    ${valueLength}  get length            ${value}
    FOR    ${i}     IN RANGE              ${valueLength}
        Press Keys    ${field}             \\8
    END

user input name
    [arguments]    ${name}
    Wait Until Element Is Visible         ${nameField}
    ${value}    Get Element Attribute     ${nameField}        value
    remove value on textfield             ${value}            ${nameField}
    Input Text                            ${nameField}        ${name}       clear=True

user choose birth of date

user select gender
    [arguments]    ${gender}
    Wait Until Element Is Visible         ${genderSelection}
    ${locator}=     Set Variable If       '${gender}' == 'Laki-laki'        xpath=//a[text()="Laki-laki"]
    ...                                   '${gender}' == 'Perempuan'        xpath=//a[text()="Perempuan"]
    Click Element                         ${genderSelection}
    Click Element                         ${locator}

user input height
    [arguments]    ${height}
    Wait Until Element Is Visible         ${heightField}
    ${value}    Get Element Attribute     ${heightField}        value
    remove value on textfield             ${value}              ${heightField}
    Input Text                            ${heightField}        ${height}       clear=True


user input weight
    [arguments]    ${weight}
    Wait Until Element Is Visible         ${weightField}
    ${value}    Get Element Attribute     ${weightField}        value
    remove value on textfield             ${value}              ${weightField}
    Input Text                            ${weightField}        ${weight}       clear=True

user input phone number
    [arguments]    ${phone}
    Wait Until Element Is Visible         ${phoneField}
    ${value}    Get Element Attribute     ${phoneField}        value
    remove value on textfield             ${value}             ${phoneField}
    Input Text                            ${phoneField}        ${phone}         clear=True

user input address
    [arguments]    ${address}
    Wait Until Element Is Visible         ${addressField}
    ${value}    Get Element Attribute     ${addressField}        value
    remove value on textfield             ${value}               ${addressField}
    Input Text                            ${addressField}        ${address}      clear=True

user click simpan button
    Wait Until Element Is Visible         ${simpanButton}
    Click Element                         ${simpanButton}

user can see validation edit profile
    [arguments]    ${validation}
    Run Keyword IF          '${validation}' == 'empty all'           user can see error empty message
    ...    ELSE IF          '${validation}' == 'invalid name'        user can see error name is invalid
    ...    ELSE IF          '${validation}' == 'less character'      user can see error less character
    ...    ELSE IF          '${validation}' == 'edit success'        user can see edit success
    ...    ELSE             Log                                      do nothing

user can see error empty message
    Wait Until Element Is Visible         xpath=//*[text()="Nama Lengkap wajib diisi"]
    Element Should Be Visible             xpath=//*[text()="Tinggi Badan wajib diisi"]
    Element Should Be Visible             xpath=//*[text()="Berat Badan wajib diisi"]
    Element Should Be Visible             xpath=//*[text()="Alamat wajib diisi"]

user can see error name is invalid
    Wait Until Element Is Visible         xpath=//*[text()="Nama harus diisi dengan huruf."]
    Element Should Be Visible             xpath=//*[text()="Nama harus diisi dengan huruf."]

user can see error less character
    Wait Until Element Is Visible         xpath=//*[text()="Kolom Nama Lengkap minimal 2"]
    Element Should Be Visible             xpath=//*[text()="Kolom Tinggi Badan minimal 2"]
    Element Should Be Visible             xpath=//*[text()="Kolom Berat Badan minimal 2"]
    Element Should Be Visible             xpath=//*[text()="Kolom No. Telp minimal 9"]
    Element Should Be Visible             xpath=//*[text()="Kolom Alamat minimal 3"]

user can see edit success
    Wait Until Element Is Visible         ${profileKamuText}
    Element Should Be Visible             ${profileKamuText}