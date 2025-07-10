*** Settings ***
Library           SeleniumLibrary
Library           ../../Resources/get_data_from_gsheet.py
Resource          ../../PageObject/Keywords/login_keywords.robot
Resource          ../../PageObject/Keywords/logout_keywords.robot
Resource          ../../PageObject/Keywords/common_keywords.robot
Resource          ../../PageObject/Keywords/program_keywords.robot
Resource          ../../Resources/variables.robot

Suite Setup       Setup Suite
Suite Teardown    Teardown Suite
Test Setup        Setup Test
Test Teardown     Teardown Test


*** Keywords ***
Fetch Login Credentials From Google Sheet
    [Arguments]    ${sheet_name}    ${row}
    ${data}=    Fetch Login Credentials From Sheet    ${SHEET_ID}    ${sheet_name}    ${row}
    Set Test Variable    ${Username}    ${data['value 1']}
    Set Test Variable    ${Password}    ${data['value 2']}
*** Test Cases ***
Login With Correct Username And Password
    [Documentation]    This test case verifies login with admin account
    [Tags]    Smoke
    Fetch Login Credentials From Google Sheet    ${SHEET_LOGIN}    ${ROW_LOGIN}
    Input Username    ${Username}
    Enter Password    ${Password}
    Click Login
    Verify Welcome Text is Visible

Verify Logout (Admin)
    [Documentation]    Logout admin
    [Tags]    Smoke
    Click Hide Popup
    Login To CLO
    Click Setting
    Click Logout
    Verify Successful Logout

*** Keywords ***
Setup Suite
    Log    ==== Starting Test Suite ====

Teardown Suite
    Log    ==== Ending Test Suite ====

Setup Test
    Open Browser    ${SITE_URL}    ${BROWSER}

Teardown Test
    Close Browser
