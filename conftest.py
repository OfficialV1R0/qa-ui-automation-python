import pytest
from playwright.sync_api import Page

BASE_URL = "https://www.saucedemo.com"

@pytest.fixture
def login(page: Page):
    def _login(user: str = "standard_user", password: str = "secret_sauce"):
        page.goto(BASE_URL)
        page.fill("#user-name", user)
        page.fill("#password", password)
        page.click("#login-button")
        return page
    return _login

@pytest.fixture
def logged_in(page: Page, login):
    p = login()
    yield p
