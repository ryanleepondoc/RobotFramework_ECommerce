*** Settings ***
Resource                    ../../resources/common.robot
Resource                    ../../steps/login_page_steps.robot
Resource                    ../../steps/product_catalogue_page_steps.robot
Resource                    ../../steps/top_navigation_bar_steps.robot
Resource                    ../../steps/my_orders_page_steps.robot
Variables                   ../../test_data/add_products.py
Variables                   ../../config/config.py

Test Setup                  Start Test      ${browser}
Test Teardown               End Test
#robot -d results tests/order_history/order_history_tests.robot

*** Test Cases ***
Added products are present in the Order history
    [Tags]      order_history
    Given user is already logged in     ${valid_email}      ${valid_password}
    And user has submitted the following products to cart     ${products}
    When user goes to My Orders page
    Then the recently submitted orders are available in My Orders page
