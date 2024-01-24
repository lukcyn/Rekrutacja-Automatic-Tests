*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${NAV_ADMINISTRATION_REKRUTACJE_HREF}     xpath=//a[@href='/recruitment']


*** Keywords ***
Navigate To Administration Rekrutacje
    Wait Until Page Contains Element     ${NAV_ADMINISTRATION_REKRUTACJE_HREF}
    Click Link                           ${NAV_ADMINISTRATION_REKRUTACJE_HREF}
    Wait Until Location Is               ${URL}/recruitment