*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${USERNAME_INPUT_ID}    id=username    
${PASSWORD_INPUT_ID}    id=password
${SUBMIT_BUTTON}        css=body > div.container.mt-3 > div > div > form > div.row.mx-1 > button


*** Keywords ***
Login to website
    [Arguments]                         ${username}               ${password}
    Location Should Be                  ${URL}/
    Wait Until Page Contains Element    ${USERNAME_INPUT_ID}
    Input Text                          ${USERNAME_INPUT_ID}      ${username}
    Input Text                          ${PASSWORD_INPUT_ID}      ${password}
    Click Button                        ${SUBMIT_BUTTON}


Verify is at administration home page
    Wait Until Location Is   ${URL}/home/administration

    