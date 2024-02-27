*** Settings ***
Library     SeleniumLibrary
Library     String

Variables   ${EXECDIR}${/}WebElements/Variables.yaml

*** Variables ***
${URL}          http://live.techpanda.org/index.php/mobile.html
${BROWSER}      chrome

*** Keywords ***
Open Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Click On Account
    Wait Until Element Is Visible    ${MagentoLogo}
    Click Element    ${AccountButton}

Click On Register
    Wait Until Element Is Visible    ${RegisterPage}
    Click Element    ${RegisterPage}

Validate Create An Account Page Appears
    Wait Until Element Is Visible    ${CreateAnAccountPage}

Fill Sign Up Information
    [Arguments]     ${FIRSTNAME}    ${LASTNAME}     ${EMAIL}    ${PASSWORD}     ${CONFIRMPASSWORD}
    Input Text    ${FirstNameTextBox}   ${FIRSTNAME}
    Input Text    ${LastNameTextBox}    ${LASTNAME}
    Input Text    ${EmailTextBox}  ${EMAIL}
    Input Text   ${PasswordTextBox}   ${PASSWORD}
    Input Password    ${ConfirmPasswordTextBox}  ${CONFIRMPASSWORD}
    
Click Register
    Click Element    ${RegisterButton}

Validate Registration Success
    Wait Until Element Is Visible    ${ThankYou}

Validate Message Appears
    [Arguments]    ${MESSAGE}   ${MESSAGEID}
    ${RequiredErrorDisplayed}=   Replace String    ${RequiredError}     placeHolder    ${MESSAGEID}
    Wait Until Element Is Visible      ${RequiredErrorDisplayed}
    ${ActualMessage}=   Get Text       ${RequiredErrorDisplayed}
    Should Be Equal As Strings    ${ActualMessage}     ${MESSAGE}







