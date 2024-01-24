*** Settings ***
Library           SeleniumLibrary


*** Variables ***

*** Keywords ***
Verify If Is On Recruitation Preview Page
    Wait Until Keyword Succeeds    5s    2s    Check If On Recruitation Preview Page


Check If On Recruitation Preview Page
    ${current_url}    Get Location
    Should Match Regexp    ${current_url}    ${URL}/recruitment/\\d+$


Verify Recruitation Details
    ${h1_elements}    Get WebElements    //h1
    ${p_elements}     Get WebElements    //p
    ${h1_length}      Get Length          ${h1_elements}
    ${p_length}       Get Length          ${p_elements}
    Should Be Equal As Integers           ${h1_length}    1
    Should Be Equal As Integers           ${p_length}     7