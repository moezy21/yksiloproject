*** Settings ***
Documentation     API Tests for Health Diary Application
Library           RequestsLibrary
Library           Collections
Library           DateTime

*** Variables ***
${BASE_URL}       http://127.0.0.1:3000
${PASSWORD}       testpass123

*** Test Cases ***
Test API Health Check
    [Documentation]    Test that the API is responding
    Create Session    healthdiary    ${BASE_URL}
    ${response}=    GET On Session    healthdiary    /
    Should Be Equal As Strings    ${response.status_code}    200

Test User Registration
    [Documentation]    Test user registration functionality
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${username}=    Set Variable    testuser${timestamp}
    Set Suite Variable    ${USERNAME}    ${username}
    Create Session    healthdiary    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    username=${username}    password=${PASSWORD}    email=test${timestamp}@example.com
    ${response}=    POST On Session    healthdiary    /api/users    json=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201

Test User Login
    [Documentation]    Test user login functionality
    Create Session    healthdiary    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${data}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    healthdiary    /api/auth/login    json=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_response}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json_response}    token

Test Get User Profile
    [Documentation]    Test getting user profile information
    Create Session    healthdiary    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${login_data}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${login_response}=    POST On Session    healthdiary    /api/auth/login    json=${login_data}    headers=${headers}
    ${token}=    Set Variable    ${login_response.json()}[token]
    ${auth_headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${response}=    GET On Session    healthdiary    /api/auth/me    headers=${auth_headers}
    Should Be Equal As Strings    ${response.status_code}    200