*** Settings ***
Resource          ../Config/${env}.robot
Resource          ../TestScenario/ProfileTest.robot
Resource          ../TestScenario/LoginTest.robot
Resource          ../TestScenario/HomeTest.robot
Suite Setup       Open Browser     https://google.com      ${BROWSER}
Test Setup        Login with email and password            ${EMAIL LOGIN}     ${PASSWORD LOGIN}    login success
Test Teardown     Logout
Suite Teardown    Close Browser

*** Test Cases ***
verify profile page element
    [Documentation]    this scenario is for verify profile page
    [tags]             regression   view   positive
    [template]         click profile menu, user can see profile page element
    ${DOB}    ${GENDER}   ${EMAIL LOGIN}   ${PHONE}   ${ADDRESS}    ${HEIGHT}    ${WEIGHT}

verify edit profile page element
    [Documentation]    this scenario is for verify edit profile page
    [tags]             regression   view   positive
    click edit profile, user can see edit profile page element

validate edit profile functionality
    [Documentation]    this scenario is for verify edit profile page
    [tags]             regression   function   negative     positive
    [template]         click edit profile, input field and click simpan button
    ${EMPTY}   ${GENDER}   ${EMPTY}   ${EMPTY}      ${EMPTY}     ${EMPTY}       empty all
    123        ${GENDER}   ${PHONE}   ${ADDRESS}    ${HEIGHT}    ${WEIGHT}      invalid name
    a          ${GENDER}   1          1             1            1              less character
    ${NAME}    ${GENDER}   ${PHONE}   ${ADDRESS}    ${HEIGHT}    ${WEIGHT}      edit success
