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

Click On Login
    Wait Until Element Is Visible    ${LoginButton}
    Click Element    ${LoginButton}

Validate Log In Page Appears
    Wait Until Element Is Visible    ${LoginPage}

Fill Log In Information
    [Arguments]     ${EMAIL}       ${PASSWORD}
    Input Text    ${EmailLoginTextBox}  ${EMAIL}
    Input Text   ${PasswordLoginTextBox}   ${PASSWORD}

Click Login Button
    Click Element    ${LoginPageButton}

Validate My Dashboard Appears
    Sleep    5s
    Wait Until Element Is Visible    ${MyDashboard}

Validate Error Message Appears
    [Arguments]    ${MESSAGE}   ${MESSAGEID}
    ${RequiredErrorDisplayed}=   Replace String    ${RequiredError}     placeHolder    ${MESSAGEID}
    Wait Until Element Is Visible      ${RequiredErrorDisplayed}        10
    ${ActualMessage}=   Get Text       ${RequiredErrorDisplayed}
    Should Be Equal As Strings    ${ActualMessage}     ${MESSAGE}

Validate Invalid Password
    [Arguments]    ${MESSAGE}   ${MESSAGEID}
    ${RequiredErrorDisplayed}=   Replace String    ${InvalidPassword}     placeHolder    ${MESSAGEID}
    Wait Until Element Is Visible      ${RequiredErrorDisplayed}        60
    ${ActualMessage}=   Get Text       ${RequiredErrorDisplayed}
    Should Be Equal As Strings    ${ActualMessage}     ${MESSAGE}










