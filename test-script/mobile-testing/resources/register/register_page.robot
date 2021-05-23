*** Settings ***
Documentation    Resources contains keyword activity in register page
Variables        %{WORKDIR}/test-script/mobile-testing/resources/register/elements.yaml

*** Keywords ***
Register Successfully
    [Documentation]               Keyword to register successfully.
    &{user}=                      Generate User Data
    Tap Create Account Button
    Fill Register Form            name=${user.name}    email=${user.email}    password=${user.password}    confirm_password=${user.confirm_password}
    Tap Register Button
    [Return]                      ${user}

Tap Create Account Button
    [Documentation]                  Keyword to tap No account yet? Create on button.
    Wait Until Element Is Visible    ${register_page_elements.register_link}
    Click Element                    ${register_page_elements.register_link}

Fill Register Form
    [Documentation]                  Keyword to input all text field on register page.
    [Arguments]                      ${name}=${name}            ${email}=${email}
    ...                              ${password}=${password}    ${confirm_password}=${confirm_password}
    Wait Until Element Is Visible    ${register_page_elements.register_name_textfield}
    Input Text                       ${register_page_elements.register_name_textfield}                ${name}
    Wait Until Element Is Visible    ${register_page_elements.register_email_textfield}
    Input Text                       ${register_page_elements.register_email_textfield}               ${email}
    Wait Until Element Is Visible    ${register_page_elements.register_password_text_field}
    Input Password                   ${register_page_elements.register_password_text_field}           ${password}
    Wait Until Element Is Visible    ${register_page_elements.register_confirm_password_textfield}
    Input Password                   ${register_page_elements.register_confirm_password_textfield}    ${confirm_password}

Tap Register Button
    [Documentation]                  Keyword to tap register button on register page.
    Wait Until Element Is Visible    ${register_page_elements.register_button}
    Click Element                    ${register_page_elements.register_button}

Verify Register Successfully
    [Documentation]                  Keyword to verify register successfully.
    Wait Until Element Is Visible    ${register_page_elements.register_name_textfield}
    Element Text Should Be           ${register_page_elements.register_email_textfield}               ${empty}
    Element Text Should Be           ${register_page_elements.register_password_text_field}           ${empty}
    Element Text Should Be           ${register_page_elements.register_confirm_password_textfield}    ${empty}

Verify Name Cannot Be Blank
    [Documentation]                  Keyword to verify name textfield should be filled.
    [Arguments]                      ${email}
    Element Should Be Visible        xpath=//*[@text="Enter Full Name"]
    Element Text Should Be           ${register_page_elements.register_email_textfield}              ${email}

Verify Email Invalid Format
    [Documentation]                  Keyword to verify email format must be filled in correctly.
    [Arguments]                      ${name}
    Element Should Be Visible        xpath=//*[@text="Enter Valid Email"]
    Element Text Should Be           ${register_page_elements.register_name_textfield}               ${name}

Verify Password Cannot Be Blank
    [Documentation]                  Keyword to verify password textfield should be filled.
    [Arguments]                      ${name}    ${email}
    Element Should Be Visible        xpath=//*[@text="Enter Password"]
    Element Text Should Be           ${register_page_elements.register_name_textfield}               ${name}
    Element Text Should Be           ${register_page_elements.register_email_textfield}              ${email}

Verify Password Does Not Match
    [Documentation]                  Keyword to verify password & confirm password does not matches.
    [Arguments]                      ${name}    ${email}
    Element Should Be Visible        xpath=//*[@text="Password Does Not Matches"]
    Element Text Should Be           ${register_page_elements.register_name_textfield}               ${name}
    Element Text Should Be           ${register_page_elements.register_email_textfield}              ${email}