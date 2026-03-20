*** Settings ***
Library                     SeleniumLibrary


*** Keywords ***
Start Test
    [Arguments]     ${browser}

    # Create ChromeOptions object
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    # Add arguments to ChromeOptions
    call method    ${chrome_options}    set_capability    pageLoadStrategy    eager

    # Open browser with proper options object
    open browser    about:blank    ${browser}    options=${chrome_options}
    maximize browser window


End Test
    close browser
