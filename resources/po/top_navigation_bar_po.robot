*** Settings ***
Library                     SeleniumLibrary


*** Variables ***
${my_order_button} =        //button[@routerlink='/dashboard/myorders']
${my_cart_button} =         //button[@routerlink='/dashboard/cart']


*** Keywords ***
Click My Order Button
    click element       ${my_order_button}


Click My Cart Button
    click element       ${my_cart_button}
