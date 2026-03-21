*** Settings ***
Resource                    ../resources/po/checkout_page_po.robot


*** Keywords ***
perform place order
    [Arguments]     ${country}
    select country      ${country}
    select place order
    is order successful
