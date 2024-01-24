*** Settings ***
Library           SeleniumLibrary


*** Keywords ***
Begin Web Test
    Open Browser    ${URL}    ${BROWSER}


End Web Test
    Close All Browsers