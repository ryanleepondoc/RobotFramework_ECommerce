*** Settings ***
Library                     SeleniumLibrary


*** Variables ***
${country_input_box} =              //input[@placeholder='Select Country']
${country_dropdown_list} =          //section[contains(@class,'ta-results')]
${country_dropdown_buttons} =       //section[contains(@class,'ta-results')]//button
${place_order_button} =             //a[text()='Place Order ']
${order_success_toast} =            //div[@id='toast-container']
${order_success_toast_message} =    Order Placed Successfully


*** Keywords ***
Select Country
    [Arguments]     ${country}
    input text      ${country_input_box}    ${country}
    wait until element is visible    ${country_dropdown_list}
    select from list of webelements    ${country}


Select From List of WebElements
    [Arguments]     ${country}
    @{list_of_elements} =   get webelements    ${country_dropdown_buttons}
    ${index}   set variable    0
    FOR    ${element}   IN    @{list_of_elements}
        ${text} =   get text    ${element}
        IF    '${country}' == '${text}'
            click element    ${element}
            BREAK
        END
    END


Select Place Order
    click element    ${place_order_button}


Is Order Successful
    wait until element is visible    ${order_success_toast}
    element text should be    ${order_success_toast}    ${order_success_toast_message}
