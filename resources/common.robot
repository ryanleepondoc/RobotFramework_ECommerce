*** Settings ***
Library                     SeleniumLibrary


*** Keywords ***
Start Test
    [Arguments]     ${browser}

    # Create ChromeOptions object
    IF    '${browser}' == 'edge'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys
    ELSE IF    '${browser}' == 'firefox'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys
    ELSE
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    END

    # Add arguments to ChromeOptions
    call method    ${options}    set_capability    pageLoadStrategy    eager

    # Open browser with proper options object
    open browser    about:blank    ${browser}    options=${options}
    maximize browser window


End Test
    close browser
