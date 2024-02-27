*** Settings ***
Library     SeleniumLibrary
Library     String

Variables   ${EXECDIR}${/}WebElements/Variables.yaml

*** Variables ***
${URL}          http://live.techpanda.org/index.php/mobile.html
${BROWSER}      chrome

*** Keywords ***
Open Magento
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
    Wait Until Element Is Visible    ${MyDashboard}

Select Category
    [Arguments]     ${CATEGORY}
    ${SelectCategory}=  Replace String   ${Categories}     placeHolder    ${CATEGORY}
    Sleep    2s
    Wait Until Element Is Visible    ${SelectCategory}
    Click Element    ${SelectCategory}

Click On Product
    [Arguments]   ${PRODUCT}
    ${SelectProduct}=  Replace String   ${Products}     placeHolder    ${PRODUCT}
    Scroll Element Into View    ${SelectProduct}
    Wait Until Element Is Visible    ${SelectProduct}
    Set Focus To Element    ${SelectProduct}
    Click Element    ${SelectProduct}

Add To Cart
    Wait Until Element Is Visible    ${AddToCartButton}
    Click Element    ${AddToCartButton}

