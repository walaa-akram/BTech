*** Settings ***
Library     RPA.Browser.Selenium
Resource    PageCommonActions.Robot

*** Variables ***

${searchResults}        xpath=//div[@class = "products list items product-items"]
${firstProduct}         xpath=//div[@id = "product_view_0"]
${firstProductImage}    xpath=//div[@id = "product_view_0"]//img[@class="product-image-photo"]

*** Keywords ***

Wait Until Search Results Appear
    Wait Until Element Is Visible    ${searchResults}    60s

Assert Product Image Appear
    Wait Until Element Is Visible    ${firstProductImage}   60s
    Element Should Be Visible   ${firstProductImage}
    
Click on First Product
    Wait Until Element Is Enabled    ${firstProduct}   60s
    Click Element    ${firstProduct}