*** Settings ***
Library     SeleniumLibrary
Library     DataDriver  ${EXECDIR}${/}TestData/TestDataMagento.xlsx     sheet_name=RemoveProductFromCart
Resource    ../Resources/RemoveFromCartResources.robot
Variables   ${EXECDIR}${/}WebElements/Variables.yaml

Suite Setup     Open Magento
Suite Teardown  Close All Browsers
Test Template   Remove Product From Cart

*** Test Cases ***
RemoveFromCart${TESTNAME}

*** Keywords ***
Remove Product From Cart
    [Arguments]    ${EMAIL}       ${PASSWORD}       ${CATEGORY}     ${PRODUCT}
    Click On Account
    Click On Login
    Validate Log In Page Appears
    Fill Log In Information      ${EMAIL}       ${PASSWORD}
    Click Login Button
    Validate My Dashboard Appears
    Click On Cart
    View Shopping Cart
#    Verify Item In Cart    ${PRODUCT}
#    Remove Item From Cart



