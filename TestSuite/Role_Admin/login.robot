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
    ${data}=    Fetch Login Credentials From Sheet    ${SHEET_ID}    ${SHEET_NAME}    ${ROW}
    Set Suite Variable    ${Username}    ${data['Username']}
    Set Suite Variable    ${Password}    ${data['Password']}

*** Test Cases ***
Verify Successful Login to CLOManagement (Admin)
    [Documentation]    This test case verifies login with admin account
    [Tags]    Smoke
    Fetch Login Credentials From Google Sheet
    Input Username
    Enter Password
    Click Login
    Verify Welcome Text is Visible

Verify Logout (Admin)
    [Documentation]    Log out admin
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
