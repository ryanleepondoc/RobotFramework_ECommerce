*** Settings ***
Resource                        ../resources/po/top_navigation_bar_po.robot
Resource                        ../resources/po/order_history_page_po.robot
Resource                        ../resources/po/my_cart_page_po.robot


*** Keywords ***
user goes to My Orders page
    Click My Order Button
    Is Order History Page Loaded


go to My Cart page
    Click My Cart Button
    Is My Cart Page Loaded


