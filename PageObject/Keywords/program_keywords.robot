*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/program_locators.py
Variables  ../Locators/homepage_locators.py

*** Keywords ***
Click Create New Program
    Wait Until Element Is Visible  ${ProgramButton}  timeout=5
    Scroll Element Into View    ${ProgramButton}
    Click Element    ${ProgramButton}
    Input Text  ${ProgramNameInputBox}  ${ProgramName}
    Input Text  ${ProgramDescriptionInputBox}  ${ProgramDescription}
    Input Text  ${ProgramDepartmentInputBox}  ${ProgramDepartment}
    Input Text  ${ProgramStartDateInputBox}  ${ProgramStartDate}
    Input Text  ${ProgramEndDateInputBox}  ${ProgramEndDate}
    Input Text  ${ProgramVersionInputBox}  ${ProgramVersion}

Click Submit Button Create New Program
    Wait Until Element Is Visible    ${CreateProgrameButton}    5
    Scroll Element Into View         ${CreateProgrameButton}
    Click Element  ${CreateProgrameButton}

Click Hide Popup
    Click Element    ${Popup}

Verify Create Program Successful
    Element Should Be Visible  ${ProgramSuccessfulText}  timeout=5