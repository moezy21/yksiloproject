*** Settings ***
Documentation     Browser Tests for Health Diary Frontend
Library           Browser

*** Variables ***
${BROWSER}        chromium
${URL}           http://127.0.0.1:8080
${USERNAME}      testuser
${PASSWORD}      testpass123

*** Test Cases ***
Test Frontend Page Load
    [Documentation]    Test that the frontend page loads correctly
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL}
    Get Title    ==    Terveyspäiväkirja
    Close Browser

Test Login Form Elements
    [Documentation]    Test that login form elements are present
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL}
    Wait For Elements State    id=login-form
    Wait For Elements State    id=username
    Wait For Elements State    id=password
    Get Text    xpath=//div[@id='login-section']/h2    ==    Kirjaudu
    Close Browser

Test Login Form Submission
    [Documentation]    Test login form submission (will fail without backend)
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL}
    Fill Text    id=username    ${USERNAME}
    Fill Text    id=password    ${PASSWORD}
    Click    xpath=//div[@id='login-section']//button[@type='submit']
    # Note: This test will show the actual behavior when backend is running
    Close Browser

Test Info Box Content
    [Documentation]    Test that the info box contains correct information
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL}
    ${info_text}=    Get Text    .info-box
    Should Contain    ${info_text}    terveyspäiväkirja
    Should Contain    ${info_text}    hyvinvointiasi
    Close Browser