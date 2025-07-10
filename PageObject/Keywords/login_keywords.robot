*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/login_locators.py
Resource   ../Keywords/homepage_keywords.robot

*** Keywords ***
Input Username
    Input Text  ${LoginUsernameInputBox}  ${Username}

Enter Password
    Input Text  ${LoginPasswordInputBox}  ${Password}

Click Login
    Click Element  ${LoginButton}

Login To CLO
    Input Username
    Enter Password
    Click Login
    Verify Welcome Text is Visible