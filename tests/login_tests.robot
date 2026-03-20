*** Settings ***
Resource                        ../steps/login_page_steps.robot
Resource                        ../steps/product_catalogue_page_steps.robot
Resource                        ../resources/common.robot

Test Setup                      Start Test      ${browser}
Test Teardown                   End Test

#robot -d results tests/login_tests.robot
*** Variables ***
${browser} =                    chrome
${VALID_USER} =                 robertdoe@gmail.com
${VALID_PASS} =                 Password@1
${INVALID_PASS} =               wrongpassword

*** Test Cases ***
Valid Login
    [Tags]      1001
    Given user is at the login page
    When user performs login with credentials   ${VALID_USER}     ${VALID_PASS}
    Then login should be successful
    And product catalogue page should be loaded


Invalid Login
    [Tags]      1002
    Given user is at the login page
    When user performs login with credentials   ${VALID_USER}     wrongpassword
    Then login should fail


Login with Empty Password
    [Tags]      1003
    Given user is at the login page
    When user performs login with credentials   ${VALID_USER}    ${EMPTY}
    Then an inline error message is shown in    password


Login with Empty Password
    [Tags]      1004
    Given user is at the login page
    When user performs login with credentials   ${EMPTY}    ${VALID_PASS}
    Then an inline error message is shown in    username


Login with Empty Credentials
    [Tags]      1005
    Given user is at the login page
    When user performs login with credentials   ${EMPTY}    ${EMPTY}
    Then an inline error message is shown in    both fields
