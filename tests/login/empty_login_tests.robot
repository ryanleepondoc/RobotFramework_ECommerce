*** Settings ***
Resource                        ../../steps/login_page_steps.robot
Resource                        ../../steps/product_catalogue_page_steps.robot
Resource                        ../../resources/common.robot
Library                         DataDriver      ../../test_data/empty_login_credentials.csv

Test Setup                      Start Test      ${browser}
Test Teardown                   End Test

#robot -d results tests/login_tests.robot
*** Variables ***
${browser} =                    chrome

*** Test Cases ***
Login with ${invalid_field} empty
    [Tags]      login   invalid
    [Template]    Attempt to Logon with Empty Credentials
    ${username}      ${password}     ${invalid_field}


*** Keywords ***
Attempt to Logon with Empty Credentials
    [Arguments]    ${username}      ${password}     ${invalid_field}
    Given user is at the login page
    When user performs login with credentials   ${username}    ${password}
    Then an inline error message is shown in    ${invalid_field}
