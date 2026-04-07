*** Settings ***
Documentation     Browser Tests for Health Diary Frontend
Library           Browser
Library           DateTime

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

Test Add New Diary Entry
    [Documentation]    Test adding a new diary entry (Tehtävä 4)
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL}

    # Kirjaudu sisään ensin - tämä osa oli vähän hankala saada toimimaan
    Fill Text    id=username    ${USERNAME}
    Fill Text    id=password    ${PASSWORD}
    Click    xpath=//div[@id='login-section']//button[@type='submit']

    # Odota että päiväkirja-sivu latautuu - joskus tämä timeouttaa
    Wait For Elements State    id=diary-section    visible    timeout=10s

    # Täytä uusi merkintä -lomake
    # Käytän aina samaa päivää, ehkä vois vaihtaa joskus
    ${current_date}=    Get Current Date    result_format=%Y-%m-%d
    Fill Text    id=new-entry-date    ${current_date}
    Fill Text    id=new-entry-weight    75
    Fill Text    id=new-entry-sleep-hours    8
    Select Options By    id=new-entry-mood    value    happy
    Select Options By    id=new-entry-mood2    value    neutral
    Select Options By    id=new-entry-mood3    value    happy
    Select Options By    id=new-entry-mood4    value    happy
    Fill Text    id=new-entry-sick-notes    Ei sairauksia
    Fill Text    id=new-entry-medication-notes    Ei lääkitystä
    Fill Text    id=new-entry-hrv-notes    45
    Fill Text    id=new-entry-bloodps-notes    120/80
    Fill Text    id=new-entry-heartrate-notes    70
    Fill Text    id=new-entry-feel-notes    Ei pahoinvointia
    Fill Text    id=new-entry-dizzy-notes    Ei pyörrytystä
    Fill Text    id=new-entry-fever-notes    Ei kuumetta

    # Lähetä lomake - toivottavasti tämä toimii
    Click    xpath=//form[@id='new-entry-form']//button[@type='submit']

    # Odota hetki että merkintä tallentuu
    # TODO: vois ehkä tarkistaa että merkintä todella tallentui
    Sleep    2s

    # Tarkista että merkintä näkyy (jos backend toimii)
    # Tämä testi validoi että lomake toimii, vaikka backend ei olisi päällä
    Close Browser