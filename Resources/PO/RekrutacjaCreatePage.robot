*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${CYCLE_INPUT}                           xpath=/html/body/div[2]/div[2]/div[2]/input
${SUBMIT_BUTTON_NAME}                    Potwierdź
${BEGIN_DATE_DAY_INPUT}                  xpath=/html/body/div[2]/div[3]/div[2]/div/div/div/input[2]
${BEGIN_DATE_MONTH_INPUT}                xpath=/html/body/div[2]/div[3]/div[2]/div/div/div/input[3]
${BEGIN_DATE_YEAR_INPUT}                 xpath=/html/body/div[2]/div[3]/div[2]/div/div/div/input[4]
${END_DATE_DAY_INPUT}                    xpath=/html/body/div[2]/div[4]/div[2]/div/div/div/input[2]
${END_DATE_MONTH_INPUT}                  xpath=/html/body/div[2]/div[4]/div[2]/div/div/div/input[3]
${END_DATE_YEAR_INPUT}                   xpath=/html/body/div[2]/div[4]/div[2]/div/div/div/input[4]
${CANDIDATE_LIMIT_INPUT}                 xpath=/html/body/div[2]/div[5]/div[2]/input

${FIELD_OF_STUDY_SELECTOR}               xpath=/html/body/div[2]/div[6]/div[2]/div/div/div[1]/div[2]


*** Keywords ***
Verify If Is On Recruitation Create Page
    Wait Until Location Is              ${URL}/recruitment/new


Click Submit
    Click Button                        ${SUBMIT_BUTTON_NAME}


Verify Toast Error Is
    [Arguments]                         ${expected_error}
    Wait Until Page Contains            ${expected_error}



Verify Toast Error On Submit
    [Arguments]                         ${expected_error}
    Click Submit
    Verify Toast Error Is               ${expected_error}


Input Cycle
    [Arguments]    ${cycle}
    Input Text    ${CYCLE_INPUT}    ${cycle}


Input Start Date
    [Arguments]  ${day}  ${month}  ${year} 
    Input Text   ${BEGIN_DATE_DAY_INPUT}    ${day}
    Input Text   ${BEGIN_DATE_MONTH_INPUT}  ${month}
    Input Text   ${BEGIN_DATE_YEAR_INPUT}   ${year}


Input End Date
    [Arguments]  ${day}  ${month}  ${year}
    Input Text   ${END_DATE_DAY_INPUT}      ${day}
    Input Text   ${END_DATE_MONTH_INPUT}    ${month}
    Input Text   ${END_DATE_YEAR_INPUT}     ${year}
    
Input Candidate Limit
    [Arguments]  ${limit}
    Input Text   ${CANDIDATE_LIMIT_INPUT}   ${limit}


Choose First Field Of Study
    Click Element    ${FIELD_OF_STUDY_SELECTOR}
    Click Element    //div[text()='Informatyka']
