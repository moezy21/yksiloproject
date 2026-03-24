*** Settings ***
Documentation     Health Diary Test Suite
Suite Setup       Log    Starting Health Diary Test Suite
Suite Teardown    Log    Health Diary Test Suite Completed

*** Test Cases ***
Suite Setup Test
    [Documentation]    Test that suite setup works
    Log    Health Diary Test Suite initialized successfully
    Should Be Equal    1    1

Run Web Form Tests
    [Documentation]    Execute web form tests (Tehtävä 3)
    Import Resource    web_form_tests.robot
    # Web form tests will run when this suite is executed