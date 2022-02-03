*** Settings ***
Resource    ../PageObject/LoginPage.robot

*** Keywords ***
Login with email and password
    [Arguments]    ${email}     ${password}     ${validation}
    Given User at Login Screen
    When user input email value                 ${email}
    AND user input password value               ${password}
    AND user tap login button
    THEN user can see validation login          ${validation}