*** Settings ***
Documentation     Test Cases for Post JsonPlaceHolder API
Library         RequestsLibrary

*** Variables ***
${content_type}=           application/json

*** Test Cases ***
Post Request And Make Sure Return Valid Data
    [Documentation]    Test to verify data input should according to the response data.
    ${data_input}=     To Json    {"title": "recommendation", "body": "motorcycle", "userId": 12}
    ${request}=        PostJsonPlaceHolder    body=${data_input}
    Verify Status Code Return 201 Created     response=${request}
    Verify Response According To Request      response=${request}    request=${data_input}

*** Keywords ***
Verify Status Code Return 201 Created
    [Documentation]              Keyword to verify status code should 201 and Created status message.
    [Arguments]                              ${response}
    Status Should Be              201        ${response}
    Should Be Equal As Strings    Created    ${response.reason}

Verify Response According To Request
    [Documentation]    Keyword to verify response should according to data request.
    [Arguments]        ${response}           ${request}
    ${posts}           Set Variable          ${response.json()}
    Should Be Equal    ${posts['title']}     ${request['title']}
    Should Be Equal    ${posts['body']}      ${request['body']}
    Should Be Equal    ${posts['userId']}    ${request['userId']}

Post Method
    [Documentation]     Keyword to define Post Request from RequestsLibrary.
    [Arguments]         ${uri}    ${header}=    ${payload}=
    Create Session      alias_name      url=https://jsonplaceholder.typicode.com    verify=True
    ${response}         Post Request    alias=alias_name    uri=${uri}    headers=${header}   data=${payload}
    [Return]            ${response}

PostJsonPlaceHolder
    [Documentation]    Keyword to call PostJsonPlaceHolder.
    [Arguments]        ${body}
    ${headers}         Create Dictionary    Content-Type=${content_type}
    ${response}        Post Method          uri=posts    payload=${body}    header=${headers}
    [Return]           ${response}