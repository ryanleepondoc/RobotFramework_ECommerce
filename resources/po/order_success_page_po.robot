*** Settings ***
Library                     SeleniumLibrary
Library                     String
Library                     Collections

*** Variables ***
${order_id_locator} =       //label[@class='ng-star-inserted']


*** Keywords ***
get list of order id
    wait until page contains element    ${order_id_locator}
    @{list_of_element} =    get webelements    ${order_id_locator}
    @{order_id_list}    create list
    FOR    ${element}   IN     @{list_of_element}
        ${order_id} =   get text    ${element}
        ${order_id} =   strip string    ${order_id}     characters=|
        ${order_id} =   strip string    ${order_id}
        append to list    ${order_id_list}   ${order_id}
    END
    RETURN    ${order_id_list}
