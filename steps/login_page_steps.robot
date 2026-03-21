*** Settings ***
Resource                        ../resources/po/login_page_po.robot
Resource                        ../resources/po/product_catalogue_page_po.robot

*** Keywords ***
user is at the login page
    Go to Login Page
    Validate Login Page


user performs login with credentials
    [Arguments]     ${username}     ${password}
    Perform Login   ${username}     ${password}


login should be successful
    Validate Successful Login Toast Message


login should fail
    Validate Failed Login Toast Message


an inline error message is shown in
    [Arguments]    ${input_field}
    IF    '${input_field}' == 'password'
        Valid Password Inline Error Message
    ELSE IF    '${input_field}' == 'username'
        Valid Username Inline Error Message
    ELSE IF     '${input_field}' == 'both fields'
        Valid Username Inline Error Message
        Valid Password Inline Error Message
    ELSE
        fail    "Invalid input field"
    END


user is already logged in
    [Arguments]     ${username}     ${password}
    user is at the login page
    user performs login with credentials    ${username}     ${password}
    login should be successful
