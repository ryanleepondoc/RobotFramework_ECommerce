*** Settings ***
Resource                        ../resources/po/product_catalogue_page_po.robot
Resource                        ../resources/po/my_cart_page_po.robot


*** Keywords ***
product catalogue page should be loaded
    Is Product Catalogue Page Loaded


the following products are added to cart
    [Arguments]    ${products}
    FOR     ${item}     IN    @{products}
        Add Item To Cart    ${item}
    END

user goes to cart without adding any item
    Go to My Cart
    Is My Cart Page Loaded