*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/program_locators.py
Variables  ../Locators/homepage_locators.py
Library           ../../Resources/get_data_from_gsheet.py
Resource          ../../Resources/variables.robot
*** Keywords ***
Click Create New Program
    Fetch Program Data From Google Sheet    ${SHEET_PROGRAM}    ${ROW_PROGRAM}
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

Fetch Program Data From Google Sheet
    [Arguments]    ${sheet_name}    ${row}
    ${data}=    Fetch Login Credentials From Sheet    ${SHEET_ID}    ${sheet_name}    ${row}
    Set Test Variable    ${ProgramName}    ${data['value 1']}
    Set Test Variable    ${ProgramDescription}    ${data['value 2']}
    Set Test Variable    ${ProgramDepartment}    ${data['value 3']}
    Set Test Variable    ${ProgramStartDate}    ${data['value 4']}
    Set Test Variable    ${ProgramEndDate}    ${data['value 5']}
    Set Test Variable    ${ProgramVersion}    ${data['value 6']}