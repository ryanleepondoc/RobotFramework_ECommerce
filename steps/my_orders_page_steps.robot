*** Settings ***
Resource                    ../resources/po/my_order_page_po.robot


*** Keywords ***
the recently submitted orders are available in My Orders page
    is order id present     ${order_ids}
