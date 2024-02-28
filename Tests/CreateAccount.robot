*** Settings ***
Library     SeleniumLibrary
Library     DataDriver  ${EXECDIR}${/}TestData/TestDataMagento.xlsx      sheet_name=CreateAccount
Resource    ../Resources/CreateAccountResources.robot
Variables   ${EXECDIR}${/}WebElements/Variables.yaml

Suite Setup     Open Website
Suite Teardown  Close All Browsers
Test Template   Create A Magento Account

*** Test Cases ***
Create Account${TESTNAME}
#robot -d Result/reports/CreateAccount Tests/CreateAccount.robot
*** Keywords ***
Create A Magento Account
    [Arguments]    ${FIRSTNAME}   ${LASTNAME}   ${EMAIL}    ${PASSWORD}  ${CONFIRMPASSWORD}     ${MESSAGE}     ${MESSAGEID}
    Click On Account
    Click On Register
    Validate Create An Account Page Appears
    Fill Sign Up Information    ${FIRSTNAME}   ${LASTNAME}  ${EMAIL}    ${PASSWORD}  ${CONFIRMPASSWORD}
    Click Register
    Validate Registration Success
    Validate Message Appears    ${MESSAGE}    ${MESSAGEID}
    

