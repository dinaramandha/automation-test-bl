*** Settings ***
Documentation     resources contains keyword activity in login page
Variables        %{WORKDIR}/test-script/mobile-testing/resources/login/elements.yaml

*** Keywords ***
Tap Already A Member Button
    [Documentation]                   Keyword to tap Already a member? button.
    Wait Until Element Is Visible     ${login_page_elements.login_link}
    Click Element                     ${login_page_elements.login_link}

Input Email On Login Page
    [Documentation]                  Keyword to input email textfiled on login page
    [Arguments]                      ${email}
    Wait Until Element Is Visible    ${login_page_elements.login_email_field}
    Input Text                       ${login_page_elements.login_email_field}    ${email}

Input Password On Login Page
    [Documentation]                  Keyword to input password textfiled on login page
    [Arguments]                      ${password}
    Wait Until Element Is Visible    ${login_page_elements.login_password_field}
    Input Password                   ${login_page_elements.login_password_field}    ${password}

Tap Login Button
    [Documentation]                  Keyword to tap login button on login page
    Wait Until Element Is Visible    ${login_page_elements.login_button}
    Click Element                    ${login_page_elements.login_button}

Verify Login Successfully
    [Documentation]                  Keyword to verify login successfully.
    [Arguments]                      ${email}    ${password}
    Wait Until Element Is Visible    ${login_page_elements.login_email_textview}
    Element Should Contain Text      ${login_page_elements.login_email_textview}       ${email}
    ${string_password}               Convert To String    ${password}
    Element Should Contain Text      ${login_page_elements.login_password_textview}    ${string_password}

Verify Invalid Email Login
    [Documentation]                    Keyword to verify email login should be valid as register.
    Page Should Contain Element        xpath=//*[@text="Enter Valid Email"]
    Page Should Not Contain Element    ${login_page_elements.login_name_textview}
    Page Should Not Contain Element    ${login_page_elements.login_email_textview}
    Page Should Not Contain Element    ${login_page_elements.login_password_textview}

Verify Invalid Password Login
    [Documentation]                    Keyword to verify password login should be valid as register.
    Page Should Not Contain Element    xpath=//*[@text="Enter Valid Email"]
    Page Should Not Contain Element    ${login_page_elements.login_name_textview}
    Page Should Not Contain Element    ${login_page_elements.login_email_textview}
    Page Should Not Contain Element    ${login_page_elements.login_password_textview}

Verify Empty Password Login
    [Documentation]                    Keyword to verify password login should be filled as register.
    Page Should Contain Element        xpath=//*[@text="Enter Valid Password"]
    Page Should Not Contain Element    ${login_page_elements.login_name_textview}
    Page Should Not Contain Element    ${login_page_elements.login_email_textview}
    Page Should Not Contain Element    ${login_page_elements.login_password_textview}