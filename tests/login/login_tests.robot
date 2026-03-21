*** Settings ***
Resource                        ../../steps/login_page_steps.robot
Resource                        ../../steps/product_catalogue_page_steps.robot
Resource                        ../../resources/common.robot
Variables                       ../../config/config.py

Test Setup                      Start Test      ${browser}
Test Teardown                   End Test
#robot -d results tests/login_tests.robot

*** Test Cases ***
Valid login
    [Tags]      login   valid
    Given user is at the login page
    When user performs login with credentials   ${valid_email}     ${valid_password}
    Then login should be successful
    And product catalogue page should be loaded


Invalid login
    [Tags]      login   invalid
    Given user is at the login page
    When user performs login with credentials   ${valid_email}     ${invalid_password}
    Then login should fail

