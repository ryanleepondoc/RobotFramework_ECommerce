*** Settings ***
Resource                        ../../steps/login_page_steps.robot
Resource                        ../../steps/product_catalogue_page_steps.robot
Resource                        ../../resources/common.robot

Test Setup                      Start Test      ${browser}
Test Teardown                   End Test

#robot -d results tests/login_tests.robot
*** Variables ***
${browser} =                    chrome
${VALID_USER} =                 robertdoe@gmail.com
${VALID_PASS} =                 Password@1
${INVALID_PASS} =               wrongpassword

*** Test Cases ***
Valid login
    [Tags]      login   valid
    Given user is at the login page
    When user performs login with credentials   ${VALID_USER}     ${VALID_PASS}
    Then login should be successful
    And product catalogue page should be loaded


Invalid login
    [Tags]      login   invalid
    Given user is at the login page
    When user performs login with credentials   ${VALID_USER}     ${INVALID_PASS}
    Then login should fail

