*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/homepage_locators.py


*** Keywords ***
Click Setting
    Click Element    ${SettingButton}

Click Logout
    Click Element    ${LogoutButton}

Verify Successful Logout
    Element Should Be Visible  ${TitleLoginText}  timeout=5