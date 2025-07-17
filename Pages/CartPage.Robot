*** Settings ***
Library     RPA.Browser.Selenium
Resource    PageCommonActions.Robot

*** Variables ***

${itemsCount}       xpath=//span[@id = "cart-head-item-counter"]
${cartItems}        xpath=//tbody[@class="cart item"]//tr[@class="item-info"]

*** Keywords ***

Assert Cart Page Contains Added Items
    Wait Until Element Is Visible    ${itemsCount}    10s
    Element Text Should Be    ${itemsCount}    1
    Page Should Contain Element    ${cartItems}