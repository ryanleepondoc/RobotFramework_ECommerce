*** Settings ***
Resource                        ../resources/po/my_cart_page_po.robot
Resource                        ../resources/po/product_catalogue_page_po.robot


*** Keywords ***
the following products are included in the My Cart page
    [Arguments]     ${products}
    Go to My Cart
    FOR    ${item}  IN    @{products}
        Locate Item In Cart     ${item}
    END


the My Cart page has no items
    Is My Cart Empty
