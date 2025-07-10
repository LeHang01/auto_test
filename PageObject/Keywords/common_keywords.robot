*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/login_locators.py

*** Keywords ***
Opening Browser
    [Arguments]  ${site_url}  ${browser}
    Open Browser  ${site_url}  ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible  ${LoginUsernameInputBox}  timeout=5
    