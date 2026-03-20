from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def get_chrome_driver(url):
    options = Options()
    options.add_argument("--start-maximized")
    options.add_argument("--disable-gpu")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.set_capability("pageLoadStrategy", "eager")
    driver = webdriver.Chrome(options=options)
    driver.get(url)
    return driver
