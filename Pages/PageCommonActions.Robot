*** Settings ***
Library     RPA.Browser.Selenium
Library     RPA.Windows
Library     RPA.Excel.Files
Library     Collections
Library     String
Library    RPA.RobotLogListener

*** Keywords ***

Click Element Using JavaScript
    [Arguments]     ${xPath}
    Execute JavaScript  document.evaluate('${xPath}',document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.click();

Scroll To Element JS
    [Arguments]     ${xpath}
    Execute JavaScript  document.evaluate('${xpath}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();
    sleep   3s

Read Excel Sheet As Dictionary
    [Arguments]     ${filePath}
    Open Workbook    ${filePath}
    ${rows}     Read Worksheet
    ${count}  Get Length    ${rows}
    ${environmentData}      Create Dictionary
    FOR  ${index}    IN RANGE   1   ${count}+1
        ${key}   Get Cell Value    ${index}    A
        ${value}   Get Cell Value    ${index}    B
        Set To Dictionary    ${environmentData}     ${key}=${value}
        Log    key is ${key} and value is ${value}
    END
    Close Workbook
    [return]          ${environmentData}

Set Environment Data
    ${environmentData}  Read Excel Sheet As Dictionary    Data/EnvironmentData.xlsx
    Set Global Variable     ${LOGIN URL}        ${environmentData}[Url]
    Set Global Variable     ${BROWSER}          ${environmentData}[Browser]
    Set Global Variable     ${searchKeyword}         ${environmentData}[searchKeyword]


Open Website
    Open Browser    ${LOGIN URL}    ${BROWSER}

Wait Untill Attribute Value Be
    [Arguments]     ${timeOut}  ${locator}  ${attribute_name}   ${expected_value}
    Wait Until Keyword Succeeds    ${timeOut}    1s    Element Attribute Value Should Be    ${locator}    ${attribute_name}    ${expected_value}

