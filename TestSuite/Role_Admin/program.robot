*** Settings ***
Documentation     Page Object in Robot Framework
Library           SeleniumLibrary
Suite Setup       Setup Suite
Suite Teardown    Teardown Suite
Test Setup        Setup Test
Test Teardown     Teardown Test

Resource          ../../PageObject/Keywords/login_keywords.robot
Resource          ../../PageObject/Keywords/logout_keywords.robot
Resource          ../../PageObject/Keywords/homepage_keywords.robot
Resource          ../../PageObject/Keywords/program_keywords.robot
Resource          ../../PageObject/Keywords/common_keywords.robot
Resource          ../../Resources/variables.robot


*** Test Cases ***
Verify Successful Create new program
    [Documentation]    This test case verifies creation of a new program
    [Tags]    Smoke
    Click Hide Popup
    Login To CLO
    Click Create New Program
    Click Submit Button Create New Program
    Verify Create Program Successful

*** Keywords ***
Setup Suite
    Log    ==== Starting Test Suite ====

Teardown Suite
    Log    ==== Ending Test Suite ====

Setup Test
    Opening Browser    ${SITE_URL}    ${BROWSER}

Teardown Test
    Close Browser
