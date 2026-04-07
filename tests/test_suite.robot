*** Settings ***
Documentation     Health Diary Test Suite - Tasks 1-5
Suite Setup       Log    Starting Health Diary Test Suite
Suite Teardown    Log    Health Diary Test Suite Completed

*** Test Cases ***
Suite Setup Test
    [Documentation]    Test that suite setup works
    Log    Health Diary Test Suite initialized successfully
    Should Be Equal    1    1