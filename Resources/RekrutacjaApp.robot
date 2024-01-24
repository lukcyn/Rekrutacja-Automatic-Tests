*** Settings ***
Resource    ./PO/LoginForm.robot
Resource    ./PO/NavBar.robot
Resource    ./PO/RekrutacjePage.robot
Resource    ./PO/RekrutacjaPreview.robot
Resource    ./PO/RekrutacjaCreatePage.robot


*** Variables ***
${USERNAME}    administration
${PASSWORD}    pass


*** Keywords ***
Login As Administration Employee
    LoginForm.Login to website  username=${USERNAME}  password=${PASSWORD}
    LoginForm.Verify Is At Administration Home Page


Go To Recruitations As Administration Employee
    NavBar.Navigate To Administration Rekrutacje
    RekrutacjePage.Verify If Is On Rekrutacje Page


Search For Recruitations
    RekrutacjePage.Search For Recruitations  searchTerm=
    RekrutacjePage.Verify Any Recruitations Is On Page
    

Go To Any Recruitation Preview By Clicking On First One In Page
    RekrutacjePage.Click On First Recruitation
    RekrutacjaPreview.Verify If Is On Recruitation Preview Page
    

Verify Recruitation Details
    RekrutacjaPreview.Verify If Is On Recruitation Preview Page
    RekrutacjaPreview.Verify Recruitation Details


Go To Create New Recruitation
    RekrutacjePage.Go To Create New Recruitation


Verify Toast Error On Invalid Input Data On Create New Recruitation
    RekrutacjaCreatePage.Verify If Is On Recruitation Create Page
    RekrutacjaCreatePage.Verify Toast Error On Submit    expected_error=Cykl rekrutacji nie może być pusty!
    
    RekrutacjaCreatePage.Input Cycle                     cycle=Test
    RekrutacjaCreatePage.Verify Toast Error On Submit    expected_error=Data początku rekrutacji nie może być pusta!

    RekrutacjaCreatePage.Input Start Date                day=1  month=1  year=2020
    RekrutacjaCreatePage.Verify Toast Error On Submit    expected_error=Data końcowa nie może być pusta!

    RekrutacjaCreatePage.Input End Date                  day=1  month=1  year=2019
    RekrutacjaCreatePage.Verify Toast Error On Submit    expected_error=Data początkowa musi być przed datą końcową

    RekrutacjaCreatePage.Input End Date                  day=1  month=1  year=2022
    RekrutacjaCreatePage.Verify Toast Error On Submit    expected_error=Limit osób musi być liczbą większą od 0!
    
    RekrutacjaCreatePage.Input Candidate Limit           limit=100
    RekrutacjaCreatePage.Verify Toast Error On Submit    expected_error=Wybierz kierunek!

    RekrutacjaCreatePage.Choose First Field Of Study
    RekrutacjaCreatePage.Verify Toast Error On Submit    expected_error=Wybierz specjalizację!
    