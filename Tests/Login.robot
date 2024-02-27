*** Settings ***
Library     SeleniumLibrary
Library     DataDriver  ${EXECDIR}${/}TestData/TestDataMagento.xlsx     sheet_name=Login
Resource    ../Resources/LoginResources.robot
Variables   ${EXECDIR}${/}WebElements/Variables.yaml

Suite Setup     Open Website
Suite Teardown  Close All Browsers
Test Template   Log Into Magento


#robot -d Result/reports/Login Tests/Login.robot

*** Test Cases ***
Login${TESTNAME}

*** Keywords ***
Log Into Magento
    [Arguments]    ${EMAIL}       ${PASSWORD}       ${MESSAGE}  	${MESSAGEID}
    Click On Account
    Click On Login
    Validate Log In Page Appears
    Fill Log In Information      ${EMAIL}       ${PASSWORD}
    Click Login Button
    Validate My Dashboard Appears
    Validate Error Message Appears      ${MESSAGE}  	${MESSAGEID}
