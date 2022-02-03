*** Settings ***
Resource    ../PageObject/HomePage.robot

*** Keywords ***
Logout
    GIVEN user at home page screen
    WHEN user click icon profile
    AND user click sign out menu