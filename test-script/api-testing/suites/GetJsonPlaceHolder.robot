*** Settings ***
Documentation    Test Cases for Get JsonPlaceHolder API
Library          RequestsLibrary
Library          Assertion.py

*** Test Cases ***
Get Request And Make Sure Status Code Return 200 Response
    [Documentation]                     Test to verify response status code should be 200 OK.
    ${request}=                         GetJsonPlaceHolder
    Verify Status Code Return 200 OK    response=${request}

Get Request And Make Sure Return Valid Data Type
    [Documentation]                      Test to verify response json should return valid data type.
    ${request}=                          GetJsonPlaceHolder
    Verify Data Return Valid DataType    response=${request}

*** Keywords ***
Verify Status Code Return 200 OK
    [Documentation]              Keyword to verify status code should 200 and OK status message.
    [Arguments]                          ${response}
    Status Should Be              200    ${response}
    Should Be Equal As Strings    OK     ${response.reason}

Verify Data Return Valid DataType
    [Documentation]                 Keyword to verify response should return valid data type.
    [Arguments]                           ${response}
    ${posts}              Set Variable    ${response.json()}
    ${response_length}    Get length      ${posts}
    FOR    ${i}    IN RANGE   ${response_length}
         Type Should Be Integer     ${posts[${i}]['userId']}
         Type Should Be Integer     ${posts[${i}]['id']}
         Type Should Be String      ${posts[${i}]['title']}
         Type Should Be String      ${posts[${i}]['body']}
    END

Get Method
    [Documentation]     Keyword to define Get Request from RequestsLibrary.
    [Arguments]         ${uri}
    Create Session      alias_name     url=https://jsonplaceholder.typicode.com    verify=True
    ${response}         Get Request    alias=alias_name    uri=${uri}
    [Return]            ${response}

GetJsonPlaceHolder
    [Documentation]    Keyword to call GetJsonPlaceHolder.
    ${response}        Get Method    uri=posts?_page=1&_limit=5
    [Return]           ${response}