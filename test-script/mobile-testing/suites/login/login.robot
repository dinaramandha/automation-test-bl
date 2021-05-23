*** Settings ***
Documentation    Test cases for positive and negative on login page.
Library          %{WORKDIR}/test-script/mobile-testing/libraries/UserLibrary.py
Resource         %{WORKDIR}/test-script/mobile-testing/libraries/android.robot
Resource         %{WORKDIR}/test-script/mobile-testing/resources/register/register_page.robot
Resource         %{WORKDIR}/test-script/mobile-testing/resources/login/login_page.robot
Test Setup       Set Up And Open Android Application
Test Teardown    Close Application

*** Variables ***
${invalid_email}       test@test
${invalid_password}    1234

*** Test Cases ***
Login Successfully
    [Documentation]                 Test to verify login will successfully with valid registered email & password.
    [Tags]                          positive-case
    &{registered_user}              Register Successfully
    Tap Already A Member Button
    Input Email On Login Page       email=${registered_user.email}
    Input Password On Login Page    password=${registered_user.password}
    Tap Login Button
    Verify Login Successfully       email=${registered_user.email}    password=${registered_user.password}

Login With Invalid Email
    [Documentation]                 Test to verify login will unsuccessfully with invalid email.
    [Tags]                          negative-case
    &{registered_user}              Register Successfully
    Tap Already A Member Button
    Input Email On Login Page       email=${invalid_email}
    Input Password On Login Page    password=${registered_user.password}
    Tap Login Button
    Verify Invalid Email Login

Login With Invalid Password
    [Documentation]                 Test to verify login will unsuccessfully with invalid password.
    [Tags]                          negative-case
    &{registered_user}              Register Successfully
    Tap Already A Member Button
    Input Email On Login Page       email=${registered_user.email}
    Input Password On Login Page    password=${invalid_password}
    Tap Login Button
    Verify Invalid Password Login

Login With Invalid Email And Password
    [Documentation]                 Test to verify login will unsuccessfully with invalid email & password.
    [Tags]                          negative-case
    Input Email On Login Page       email=${invalid_email}
    Input Password On Login Page    password=${invalid_password}
    Tap Login Button
    Verify Invalid Email Login

Login With Empty Email
    [Documentation]                 Test to verify login will unsuccessfully with empty email.
    [Tags]                          negative-case
    &{registered_user}              Register Successfully
    Tap Already A Member Button
    Input Email On Login Page       email=${empty}
    Input Password On Login Page    password=${registered_user.password}
    Tap Login Button
    Verify Invalid Email Login

Login With Empty Password
    [Documentation]                 Test to verify login will unsuccessfully with empty password.
    [Tags]                          negative-case
    &{registered_user}              Register Successfully
    Tap Already A Member Button
    Input Email On Login Page       email=${registered_user.email}
    Input Password On Login Page    password=${empty}
    Tap Login Button
    Verify Empty Password Login

Login With Empty Email And Password
    [Documentation]                 Test to verify login will unsuccessfully with empty email & password.
    [Tags]                          negative-case
    Input Email On Login Page       email=${empty}
    Input Password On Login Page    password=${empty}
    Tap Login Button
    Verify Invalid Email Login