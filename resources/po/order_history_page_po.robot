*** Settings ***
Library                     SeleniumLibrary


*** Variables ***
${order_history_headet_text} =      //div/h1[@class='ng-star-inserted']


*** Keywords ***
Is Order History Page Loaded
    wait until page contains element    ${order_history_headet_text}
