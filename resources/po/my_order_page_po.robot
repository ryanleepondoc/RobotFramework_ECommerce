*** Settings ***
Library                     SeleniumLibrary
Library                     String


*** Variables ***
${my_order_id_locator} =       //th[text()='{}']


*** Keywords ***
Is Order Id Present
    [Arguments]    ${order_ids}
    FOR     ${id}   IN    @{order_ids}
        ${locator} =    replace string    ${my_order_id_locator}   {}      ${id}
        page should contain element    ${locator}
    END