*** Settings ***
Resource          ../Config/${env}.robot
Resource          ../TestScenario/LoginTest.robot
Suite Setup       Launch Mobile Browser     Pixel 2     https://google.com
Suite Teardown    Close Browser

*** Test Cases ***
verify and validate login page
    [Documentation]    this scenario is for positif and negatif login page
    [tags]             regression   view      function      negative     positive
    [template]         Login with email and password
    ${EMPTY}           ${EMPTY}             empty all
    invalid            ${PASSWORD LOGIN}    invalid email
    unregis@xyz.ab     ${PASSWORD LOGIN}    unregister user
    ${EMAIL LOGIN}     invalid              invalid password
    ${EMAIL LOGIN}     abc                  less password
    ${EMAIL LOGIN}     ${PASSWORD LOGIN}    login success
