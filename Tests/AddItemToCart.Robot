*** Settings ***
Resource    ../Pages/HomePage.Robot
Resource    ../Pages/SearchResultsPage.Robot
Resource    ../Pages/CartPage.Robot
Resource    ../Pages/ProductPage.Robot


*** Test Cases ***
Add Item to Cart
    [Tags]  UAT Regression
    Open Website
    Input Search Term And Submit
    Wait Until Search Results Appear
    Assert Product Image Appear
    Click on First Product
    Click on Add To Cart
    Assert Item Added and Go To Cart Page