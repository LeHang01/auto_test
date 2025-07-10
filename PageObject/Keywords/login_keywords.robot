*** Settings ***
Library    SeleniumLibrary
Variables  ../Locators/login_locators.py

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    ${LoginUsernameInputBox}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${LoginPasswordInputBox}    ${password}

Click Login
    Click Element    ${LoginButton}

Login To CLO
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Enter Password    ${password}
    Click Login

Verify Welcome Text is Visible
    Element Should Be Visible    ${WelcomeText}

Verify Login Error Message
    [Arguments]    ${expected_message}
    Element Should Be Visible    ${ErrorMessage}    timeout=5s
    ${actual_message}=    Get Text    ${ErrorMessage}
    Should Be Equal    ${actual_message}    ${expected_message}
