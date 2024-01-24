*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${SEARCH_INPUT_SELECTOR}                   css=body > div:nth-child(11) > div.d-flex.align-items-center.w-50.p-3 > form > input
${BUTTON_LABEL}                            xpath=/html/body/div[2]/div[1]/form/button
${BUTTON_RECRUITMENT_CARD}                 xpath://button[text()='Podgląd']
${BUTTON_CREATE_RECRUITMENT}               xpath=/html/body/div[2]/div[2]/a/button

*** Keywords ***
Verify If Is On Rekrutacje Page
    Wait Until Location Is              ${URL}/recruitment


Search For Recruitations
    [Arguments]                         ${searchTerm}
    Location Should Be                  ${URL}/recruitment
    Input Text                          ${SEARCH_INPUT_SELECTOR}    ${searchTerm}
    Click Element                       ${BUTTON_LABEL}


Verify Any Recruitations Is On Page
    Location Should Be                  ${URL}/recruitment
    Wait Until Page Contains Element    ${BUTTON_RECRUITMENT_CARD}


Click On First Recruitation
    Click Element                       ${BUTTON_RECRUITMENT_CARD}


Go To Create New Recruitation
    Click Element                       ${BUTTON_CREATE_RECRUITMENT}
    Wait Until Location Is              ${URL}/recruitment/new