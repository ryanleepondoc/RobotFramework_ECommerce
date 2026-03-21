*** Settings ***
Library                     SeleniumLibrary


*** Variables ***
${product} =                    ${None}
${product_container} =          //section[@id='products']
${toast_add_item_success} =     //div[@id='toast-container']//div[@role='alert']


*** Keywords ***
Is Product Catalogue Page Loaded
    wait until page contains element    ${product_container}


Add Item To Cart
    [Arguments]    ${product}
    ${add_item_buttom}  set variable    //h5/b[text()='${product}']/ancestor::div[@class='card-body']/button/i[@class='fa fa-shopping-cart']
    click element    ${add_item_buttom}
    wait until element is visible    ${toast_add_item_success}
    wait until element is not visible    ${toast_add_item_success}
