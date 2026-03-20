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
    When user performs login with credentials   ${VALID_USER}     ${INVALID_PASS}
    Then login should fail


Login with Empty Credentials
    [Tags]      1003
    [Template]    Empty Credentials
    ${VALID_USER}       ${EMPTY}                password
    ${EMPTY}            ${VALID_PASS}           username
    ${EMPTY}            ${EMPTY}                both fields


*** Keywords ***
Empty Credentials
    [Arguments]    ${username}      ${password}     ${invalid_field}
    Given user is at the login page
    When user performs login with credentials   ${username}    ${password}
    Then an inline error message is shown in    ${invalid_field}
