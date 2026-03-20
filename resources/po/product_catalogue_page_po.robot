*** Settings ***
Library                     SeleniumLibrary


*** Variables ***
${product_container} =      //section[@id='products']


*** Keywords ***
Validate Product Catalogue Page
    wait until page contains element    ${product_container}