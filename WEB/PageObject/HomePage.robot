*** Variable ***
${sehatQImg}                xpath=//img[@alt="SehatQ"]
${profileIcon}              id=popover-profile
${profileMenu}              xpath=//a[text()="Profil"]
${signOutMenu}              xpath=//a[text()="Sign Out"]

*** Keywords ***
user at home page screen
    go to                                 https://${URL}
    Wait Until Element Is Visible         ${sehatQImg}
    Sleep                                 1

user click icon profile
    Wait Until Element Is Visible         ${profileIcon}
    Click Element                         ${profileIcon}

user click profile menu
    Wait Until Element Is Visible         ${profileMenu}
    Click Element                         ${profileMenu}

user click sign out menu
    Wait Until Element Is Visible         ${signOutMenu}
    Click Element                         ${signOutMenu}