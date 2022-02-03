*** Settings ***
Documentation     A resource for global
Library           SeleniumLibrary      10        run_on_failure=Capture Page Screenshot
Library           String
Library           BuiltIn

*** Variable ***
${BROWSER}                  chrome
${URL}                      sehatq.com
${EMAIL LOGIN}              dhekapektoy@gmail.com
${PASSWORD LOGIN}           Vimmal14
${NAME}                     pras
${DOB}                      05 Juli 1992
${GENDER}                   Laki-laki
${PHONE}                    6281220172375
${ADDRESS}                  bandung
${HEIGHT}                   170
${WEIGHT}                   60