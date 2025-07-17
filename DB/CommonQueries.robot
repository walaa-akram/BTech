*** Settings ***
Library     DatabaseLibrary
Resource    ../Pages/PageCommonActions.robot

*** Keywords ***

Connect to SqlServer DB
    [Arguments]     ${dbUrl}    ${dbUser}   ${dbPassword}   ${dbName}   ${dbAlias}
    ${dbDriver}  Set Variable   ODBC Driver 18 for SQL Server
    ${hostConnection}   Set Variable    DRIVER={${dbDriver}};DATABASE=${dbUrl};UID=${dbUser};PWD=${dbPassword};SERVER=${dbName};Encrypt=no;
    Connect To Database Using Custom Connection String    pyodbc   ${hostConnection}    alias=${dbAlias}

Connect to OracleServer DB
    [Arguments]     ${dbUrl}    ${dbPort}    ${dbUser}   ${dbPassword}   ${dbName}   ${dbAlias}
    Connect To Database     cx_Oracle   ${dbName}   ${dbUser}   ${dbPassword}   ${dbUrl}    ${dbPort}   alias=${dbAlias}

Disconnect from DB
    [Arguments]     ${dbAlias}
    Disconnect From Database    alias=${dbAlias}