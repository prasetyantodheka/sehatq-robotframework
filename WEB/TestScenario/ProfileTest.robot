*** Settings ***
Resource    ../PageObject/ProfilePage.robot
Resource    ../PageObject/HomePage.robot

*** Keywords ***
click profile menu, user can see profile page element
    [Arguments]    ${dob}    ${gender}   ${email}   ${phone}   ${address}    ${height}    ${weight}
    GIVEN user at home page screen
    WHEN user click icon profile
    AND user click profile menu
    THEN user can see profile page according with user data     ${dob}    ${gender}   ${email}   ${phone}   ${address}    ${height}    ${weight}

click edit profile, user can see edit profile page element
    GIVEN user at home page screen
    WHEN user click icon profile
    AND user click profile menu
    AND user click edit profile
    THEN user can see edit profile page

click edit profile, input field and click simpan button
    [Arguments]   ${name}    ${gender}   ${phone}   ${address}    ${height}    ${weight}      ${validation}
    GIVEN user at home page screen
    WHEN user click icon profile
    AND user click profile menu
    AND user click edit profile
    AND user input name                             ${name}
    AND user select gender                          ${gender}
    AND user input height                           ${height}
    AND user input weight                           ${weight}
    AND user input phone number                     ${phone}
    AND user input address                          ${address}
    AND user click simpan button
    THEN user can see validation edit profile       ${validation}

