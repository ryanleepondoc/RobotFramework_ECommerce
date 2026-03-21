*** Settings ***
Library                                 SeleniumLibrary
Variables                               ../../config/config.py

*** Variables ***
${username_text_box} =                  id=userEmail
${password_text_box} =                  id=userPassword
${login_button} =                       //input[@name='login']
${success_login_toast_locator} =        //div[contains(@class, 'toast-title')]
${success_login_toast_message} =        Login Successfully
${failed_login_toast_locator} =         //div[contains(@class, 'toast-message')]
${failed_login_toast_message} =         Incorrect email or password.
${username_required_inline_locator} =   css=input#userEmail + div.invalid-feedback > div
${username_required_inline_message} =   *Email is required
${password_required_inline_locator} =   css=input#userPassword + div.invalid-feedback > div
${password_required_inline_message} =   *Password is required

*** Keywords ***
Go to Login Page
    go to    ${url}


Perform Login
    [Arguments]     ${username}     ${password}
    input text          ${username_text_box}    ${username}
    input text          ${password_text_box}    ${password}
    click element       ${login_button}


Validate Login Page
    wait until page contains element    ${login_button}


Validate Successful Login Toast Message
    wait until element is visible    ${success_login_toast_locator}
    element text should be    ${success_login_toast_locator}    ${success_login_toast_message}
    wait until element is not visible    ${success_login_toast_locator}


Validate Failed Login Toast Message
    wait until element is visible    ${failed_login_toast_locator}
    element text should be    ${failed_login_toast_locator}    ${failed_login_toast_message}
    wait until element is not visible    ${failed_login_toast_locator}


Valid Password Inline Error Message
    wait until page contains element    ${password_required_inline_locator}
    element text should be    ${password_required_inline_locator}    ${password_required_inline_message}

Valid Username Inline Error Message
    wait until page contains element    ${username_required_inline_locator}
    element text should be    ${username_required_inline_locator}    ${username_required_inline_message}
