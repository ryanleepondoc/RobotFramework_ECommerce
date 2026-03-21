*** Settings ***
Resource                        ../../resources/common.robot
Resource                        ../../steps/login_page_steps.robot
Resource                        ../../steps/my_cart_page_steps.robot
Resource                        ../../steps/product_catalogue_page_steps.robot
Variables                       ../../config/config.py
Variables                       ../../test_data/add_products.py

Test Setup                      Start Test  ${browser}
Test Teardown                   End Test
#robot -d results tests/product_catalogue/submit_order_tests.robot

*** Test Cases ***
Successfully add items to cart
    [Tags]      submit_order
    Given user is already logged in     ${valid_email}      ${valid_password}
    When the following products are added to cart   ${products}
    Then the following products are included in the My Cart page    ${products}


No item added to cart
    [Tags]      submit_order
    Given user is already logged in     ${valid_email}      ${valid_password}
    When user goes to cart without adding any item
    Then the My Cart page has no items