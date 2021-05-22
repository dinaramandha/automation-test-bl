*** Settings ***
Documentation    Test cases for positive and negative on register page
Library          %{WORKDIR}/test-script/mobile-testing/libraries/UserLibrary.py
Resource         %{WORKDIR}/test-script/mobile-testing/libraries/android.robot
Resource         %{WORKDIR}/test-script/mobile-testing/resources/register/register_page.robot
Test Setup       Set Up And Open Android Application
Test Teardown    Close Application

*** Variables ***
${invalid_email}         test@test
${unmatch_password}      1234
${min_digit_password}    1

*** Test Cases ***
Register Successfully
    [Documentation]                Test to verify register will successfully with complete data filled.
    [Tags]                         positive-case
    &{user}=                       Generate User Data
    Tap Create Account Button
    Fill Register Form             name=${user.name}    email=${user.email}    password=${user.password}    confirm_password=${user.confirm_password}
    Tap Register Button
    Verify Register Successfully

Register With 1 Digit Password
    [Documentation]                Test to verify register will successfully with input 1 digit password.
    [Tags]                         positive-case
    &{user}=                       Generate User Data
    Tap Create Account Button
    Fill Register Form             name=${user.name}    email=${user.email}    password=${min_digit_password}    confirm_password=${min_digit_password}
    Tap Register Button
    Verify Register Successfully

Register With Empty Name
     [Documentation]                Test to verify register will unsuccessfully with empty name.
     [Tags]                         negative-case
     &{user}=                       Generate User Data
     Tap Create Account Button
     Fill Register Form             name=${empty}    email=${user.email}    password=${user.password}    confirm_password=${user.confirm_password}
     Tap Register Button
     Verify Name Cannot Be Blank    email=${user.email}

Register With Invalid Email Format
     [Documentation]                Test to verify register will unsuccessfully with invalid email format.
     [Tags]                         negative-case
     &{user}=                       Generate User Data
     Tap Create Account Button
     Fill Register Form             name=${user.name}    email=${invalid_email}    password=${user.password}    confirm_password=${user.confirm_password}
     Tap Register Button
     Verify Email Invalid Format    name=${user.name}

Register With Empty Password
     [Documentation]                    Test to verify register will unsuccessfully with invalid email format.
     [Tags]                             negative-case
     &{user}=                           Generate User Data
     Tap Create Account Button
     Fill Register Form                 name=${user.name}    email=${user.email}    password=${empty}    confirm_password=${user.confirm_password}
     Tap Register Button
     Verify Password Cannot Be Blank    name=${user.name}    email=${user.email}

Register With Unmatch Password
     [Documentation]                   Test to verify register will unsuccessfully with unmatch between password & confirm pasasword.
     [Tags]                            negative-case
     &{user}=                          Generate User Data
     Tap Create Account Button
     Fill Register Form                name=${user.name}    email=${user.email}    password=${user.password}    confirm_password=${unmatch_password}
     Tap Register Button
     Verify Password Does Not Match    name=${user.name}    email=${user.email}