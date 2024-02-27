*** Settings ***
Library     SeleniumLibrary
Library     DataDriver  ${EXECDIR}${/}TestData/TestDataMagento.xlsx     sheet_name=AddProductToCart
Resource    ../Resources/AddToCartResources.robot
Variables   ${EXECDIR}${/}WebElements/Variables.yaml

Suite Setup     Open Magento
Suite Teardown  Close All Browsers
Test Template   Add Product ToCart

*** Test Cases ***
AddToCart${TESTNAME}

*** Keywords ***
Add Product To Cart
    [Arguments]    ${EMAIL}       ${PASSWORD}       ${CATEGORY}     ${PRODUCT}
    Click On Account
    Click On Login
    Validate Log In Page Appears
    Fill Log In Information      ${EMAIL}       ${PASSWORD}
    Click Login Button
    Validate My Dashboard Appears
    Select Category     ${CATEGORY}
    Click On Product    ${PRODUCT}
    Add To Cart






