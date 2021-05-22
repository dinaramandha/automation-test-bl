*** Settings ***
Documentation    Resources keyword of android mobile.
Library          settings.py
Library          AppiumLibrary

*** Keywords ***
Set Up And Open Android Application
    [Documentation]     Set Up And Open Android Application
    Open Application    %{RUNNER_URL}    platformName=%{ANDROID_PLATFORM}    platformVersion=%{ANDROID_VERSION}
    ...                 deviceName=%{ANDROID_DEVICE_NAME}    app=%{ANDROID_APP}    udid=%{ANDROID_DEVICE_NAME}