*** Settings ***
Documentation     A resource for global
Library           AppiumLibrary      10        run_on_failure=Capture Page Screenshot
Library           String
Library           BuiltIn

*** Variable ***
${EMAIL LOGIN}              prasetya@mailinator.com
${PASSWORD LOGIN}           sehatq123
${NAME}                     pras
${DOB}                      05 Juli 1992
${GENDER}                   Laki-laki
${PHONE}                    6281220172375
${ADDRESS}                  bandung
${HEIGHT}                   170
${WEIGHT}                   60
${APKPATH}                  C:\\Users\\Gery\\Documents\\sehatq\\Automations\\ANDROID\\Basic\\app-debug-feature_rizky_ANDRO-297-2720.apk

*** Keywords ***
Start Application on Local
    Open Application    http://127.0.0.1:4723/wd/hub
    ...     platformName=android        platformVersion=11
    ...     app=${APKPATH}              appPackage=com.she.sehatq.debug      appActivity=com.she.sehatq.view.intro.SplashActivity
    ...     newCommandTimeout=2500      noReset=true                         autoGrantPermissions=true
    ...     unicodeKeyboard=true        resetKeyboard=true                   automationName=uiautomator2     dontStopAppOnReset=true     adbExecTimeout=60000

Before Test
    Start Activity          appPackage=com.she.sehatq.debug    appActivity=com.she.sehatq.view.intro.SplashActivity

After Suite
    Remove Application      com.she.sehatq.debug
    Close Application