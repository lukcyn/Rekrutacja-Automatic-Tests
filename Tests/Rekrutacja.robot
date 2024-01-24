*** Settings ***
Resource        ../Resources/RekrutacjaApp.robot
Resource        ../Resources/CommonWeb.robot
Test Setup      Begin Web Test
Test Teardown   End Web Test

# robot -d results ./Tests/Rekrutacja.robot

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:3000


*** Test Cases ***
Should Be Able To Login As Administration Employee
    [Documentation]   As an administration employee I should be able to login to the application
    [Tags]            smoke
    RekrutacjaApp.Login As Administration Employee


Administration Employee Should Be Able To Search For Recruitations
    [Documentation]   As an administration employee I should be able to search for recruitations
    [Tags]            smoke
    RekrutacjaApp.Login As Administration Employee
    RekrutacjaApp.Go To Recruitations As Administration Employee
    RekrutacjaApp.Search For Recruitations


Administration Employee Should Be Able To View Recruitation
    [Documentation]   As an administration employee I should be able to view recruitations
    [Tags]            smoke
    RekrutacjaApp.Login As Administration Employee
    RekrutacjaApp.Go To Recruitations As Administration Employee
    RekrutacjaApp.Search For Recruitations
    RekrutacjaApp.Go To Any Recruitation Preview By Clicking On First One In Page
    RekrutacjaApp.Verify Recruitation Details


Administration Employee Should See Error If The Input Data Is Invalid When Creating Event
    [Documentation]   As an administration employee I should see error if the input data is invalid when creating event
    [Tags]            smoke
    RekrutacjaApp.Login As Administration Employee
    RekrutacjaApp.Go To Recruitations As Administration Employee
    RekrutacjaApp.Search For Recruitations
    RekrutacjaApp.Go To Create New Recruitation
    RekrutacjaApp.Verify Toast Error On Invalid Input Data On Create New Recruitation