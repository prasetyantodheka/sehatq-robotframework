*** Settings ***
Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/ProfilePage.robot

*** Keywords ***
Logout
    GIVEN user at home page screen
    WHEN user click icon profile
    AND user click more button
    AND user click pengaturan button
    THEN user click logout button