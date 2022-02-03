*** Settings ***
Resource    ../PageObject/LoginPage.robot
Resource    ../PageObject/HomePage.robot

*** Keywords ***
Login with email and password
    [Arguments]    ${email}     ${password}     ${validation}
    GIVEN user is on home page
    WHEN user click profile menu
    AND user input email value                  ${email}
    AND user input password value               ${password}
    AND user tap login button
    THEN user can see validation login          ${validation}