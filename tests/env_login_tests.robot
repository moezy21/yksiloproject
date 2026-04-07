*** Settings ***
Documentation     Login Tests using .env file (Tehtävä 5)
Library           Browser
Library           OperatingSystem
Library           String

*** Variables ***
${BROWSER}        chromium
${URL}           http://127.0.0.1:8080

*** Test Cases ***
Test Login With Env Credentials
    [Documentation]    Test login using credentials from .env file
    # Lue credentials .env tiedostosta - tämä oli vähän hankala saada toimimaan
    ${env_content}=    Get File    ${EXECDIR}/.env
    ${username}=    Get Environment Variable From File    ${env_content}    TEST_USERNAME
    ${password}=    Get Environment Variable From File    ${env_content}    TEST_PASSWORD

    # Avaa selain ja siirry sivulle
    New Browser    ${BROWSER}    headless=false
    New Page    ${URL}

    # Täytä kirjautumislomake .env credentialsien avulla
    # TODO: vois ehkä testata myös väärillä credentials mitä tapahtuu
    Fill Text    id=username    ${username}
    Fill Text    id=password    ${password}

    # Lähetä lomake
    Click    xpath=//div[@id='login-section']//button[@type='submit']

    # Odota hetki (backend ei välttämättä toimi testiympäristössä)
    Sleep    3s

    # Sulje selain
    Close Browser

*** Keywords ***
Get Environment Variable From File
    [Arguments]    ${file_content}    ${variable_name}
    # Tämä funktio jäi vähän kömpelöksi mutta toimii
    # Ehkä vois myöhemmin tehdä paremmin
    ${lines}=    Split String    ${file_content}    \n
    FOR    ${line}    IN    @{lines}
        ${line}=    Strip String    ${line}
        ${is_comment}=    Run Keyword And Return Status    Should Start With    ${line}    #
        IF    not ${is_comment} and "=" in "${line}"
            ${parts}=    Split String    ${line}    =    1
            ${key}=    Strip String    ${parts}[0]
            ${value}=    Strip String    ${parts}[1]
            IF    "${key}" == "${variable_name}"
                RETURN    ${value}
            END
        END
    END
    Fail    Environment variable ${variable_name} not found in .env file