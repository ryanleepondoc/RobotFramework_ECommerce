*** Settings ***
Resource                        ../resources/po/product_catalogue_page_po.robot
Resource                        ../resources/po/my_cart_page_po.robot
Resource                        ../steps/top_navigation_bar_steps.robot
Resource                        ../steps/checkout_page_steps.robot
Resource                        ../steps/order_success_page_steps.robot


*** Keywords ***
product catalogue page should be loaded
    is product catalogue page loaded


the following products are added to cart
    [Arguments]    ${products}
    FOR     ${item}     IN    @{products}
        add item to Cart    ${item}
    END


user goes to cart without adding any item
    go to my cart page


user has submitted the following products to cart
    [Arguments]    ${products}
    the following products are added to cart    ${products}
    go to my cart page
    click checkout button
    perform place order     India
    @{order_ids} =  get order id
    set test variable    @{order_ids}
