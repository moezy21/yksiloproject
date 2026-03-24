*** Settings ***
Documentation     Web Form Tests - Tehtävä 3
Library           Browser
Library           OperatingSystem

*** Variables ***
${URL}           http://127.0.0.1:8080/web-form-test.html

*** Test Cases ***
Test Dropdown Select
    [Documentation]    Test dropdown select element functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    Select Options By    id=dropdown-select    value    option1
    Get Selected Options    id=dropdown-select    label    ==    Vaihtoehto 1
    Select Options By    id=dropdown-select    text    Vaihtoehto 2
    Get Selected Options    id=dropdown-select    label    ==    Vaihtoehto 2
    Close Browser

Test Dropdown Datalist
    [Documentation]    Test dropdown datalist element functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    Fill Text    id=dropdown-datalist    Firefox
    # Datalist doesn't have direct selection, but we can verify the input value
    Get Text    id=dropdown-datalist    ==    Firefox
    Fill Text    id=dropdown-datalist    Chrome
    Get Text    id=dropdown-datalist    ==    Chrome
    Close Browser

Test File Input
    [Documentation]    Test file input element functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    # Create a temporary test file
    Create File    /tmp/test_file.txt    This is a test file content
    Upload File By Selector    input[id="file-input"]    /tmp/test_file.txt
    # File upload is successful if no error occurs
    Log    File upload test completed successfully
    Close Browser

Test Checkboxes
    [Documentation]    Test checkbox elements functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    # Test individual checkboxes
    Check Checkbox    id=checkbox1
    ${checked1}=    Get Checkbox State    id=checkbox1
    Should Be True    ${checked1}
    Check Checkbox    id=checkbox3
    ${checked3}=    Get Checkbox State    id=checkbox3
    Should Be True    ${checked3}
    # Uncheck one
    Uncheck Checkbox    id=checkbox1
    ${unchecked1}=    Get Checkbox State    id=checkbox1
    Should Not Be True    ${unchecked1}
    # Verify others still checked
    ${still_checked3}=    Get Checkbox State    id=checkbox3
    Should Be True    ${still_checked3}
    Close Browser

Test Radio Buttons
    [Documentation]    Test radio button elements functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    # Test radio button selection
    Check Checkbox    id=radio1
    ${checked1}=    Get Checkbox State    id=radio1
    Should Be True    ${checked1}
    # Select another radio button (should unselect the first)
    Check Checkbox    id=radio2
    ${checked2}=    Get Checkbox State    id=radio2
    Should Be True    ${checked2}
    ${unchecked1}=    Get Checkbox State    id=radio1
    Should Not Be True    ${unchecked1}
    # Select third option
    Check Checkbox    id=radio3
    ${checked3}=    Get Checkbox State    id=radio3
    Should Be True    ${checked3}
    ${unchecked2}=    Get Checkbox State    id=radio2
    Should Not Be True    ${unchecked2}
    Close Browser

Test Text Input
    [Documentation]    Test text input element functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    Fill Text    id=text-input    Hello World
    Get Text    id=text-input    ==    Hello World
    Fill Text    id=text-input    Test automation with Robot Framework
    Get Text    id=text-input    ==    Test automation with Robot Framework
    Close Browser

Test Textarea
    [Documentation]    Test textarea element functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    Fill Text    id=textarea    This is a test message in textarea.
    Get Text    id=textarea    ==    This is a test message in textarea.
    Fill Text    id=textarea    Robot Framework Browser Library testing
    Get Text    id=textarea    ==    Robot Framework Browser Library testing
    Close Browser

Test Form Reset
    [Documentation]    Test form reset button functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    # Fill form elements
    Fill Text    id=text-input    Test text
    Fill Text    id=textarea    Test textarea
    Check Checkbox    id=checkbox1
    Check Checkbox    id=radio1
    Select Options By    id=dropdown-select    value    option1
    # Reset form
    Click    button[type="reset"]
    # Verify elements are reset
    Get Text    id=text-input    ==    ${EMPTY}
    Get Text    id=textarea    ==    ${EMPTY}
    ${unchecked1}=    Get Checkbox State    id=checkbox1
    Should Not Be True    ${unchecked1}
    ${unchecked_radio}=    Get Checkbox State    id=radio1
    Should Not Be True    ${unchecked_radio}
    Close Browser

Test Form Submission
    [Documentation]    Test form submission functionality
    New Browser    chromium    headless=false
    New Page    ${URL}
    # Fill required fields and submit
    Fill Text    id=text-input    Test submission
    Click    button[type="submit"]
    # Verify result is shown
    Wait For Elements State    id=result
    Get Text    xpath=//div[@id='result']/h3    ==    Lomake lähetetty!
    Close Browser