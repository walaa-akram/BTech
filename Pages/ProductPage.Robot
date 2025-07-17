*** Settings ***
Library     RPA.Browser.Selenium
Resource    PageCommonActions.Robot

*** Variables ***

${addToCart}        xpath=//button[@id = "product-addtocart-button"]
${addToCartPath}    //button[@id = "product-addtocart-button"]
${itemAdded}        xpath=//p[@class="item-added"]
${CartPageButton}   xpath=//button[contains(@class , "go-to-cart-btn")]

*** Keywords ***

Click on Add To Cart
    Wait Until Element Is Enabled    ${addToCart}    60s
    Click Element Using JavaScript  ${addToCartPath}

Assert Item Added and Go To Cart Page
    Wait Until Element Is Visible    ${itemAdded}   30s
    Click Element    ${CartPageButton}

