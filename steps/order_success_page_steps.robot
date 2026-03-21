*** Settings ***
Resource                        ../resources/po/order_success_page_po.robot


*** Keywords ***
get order id
    @{list_of_order_ids} =  get list of order id
    RETURN    ${list_of_order_ids}
