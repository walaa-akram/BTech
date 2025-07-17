*** Settings ***
Library     RPA.Browser.Selenium
Resource    PageCommonActions.Robot

*** Variables ***

${searchTextBox}       xpath=//input[@type='search']

*** Keywords ***

Input Search Term And Submit
    Input Text    ${searchTextBox}    ${searchKeyword}
    RPA.Browser.Selenium.Press Keys    ${searchTextBox}    RETURN
