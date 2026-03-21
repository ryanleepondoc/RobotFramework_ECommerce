*** Settings ***
Library                     SeleniumLibrary


*** Variables ***
${my_cart_header_text} =        //h1[text()='My Cart']
${my_cart_empty_message} =      //div[@class='ng-star-inserted']/h1
${my_cart_empty_text} =         No Products in Your Cart !
${checkout_button} =            //button[text()='Checkout']


*** Keywords ***
Is My Cart Page Loaded
    wait until page contains element    ${my_cart_header_text}


Locate Item In Cart
    [Arguments]     ${product}
    ${product_name}     set variable    //h3[contains(text(), '${product}')]
    wait until element is visible    ${product_name}

Is My Cart Empty
    wait until page contains element    ${my_cart_empty_message}
    element text should be    ${my_cart_empty_message}      ${my_cart_empty_text}

Click Checkout button
    wait until page contains element    ${checkout_button}
    mouse over    ${checkout_button}
    click element    ${checkout_button}
