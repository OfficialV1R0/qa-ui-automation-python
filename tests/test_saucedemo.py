from playwright.sync_api import Page, expect
from conftest import BASE_URL

def test_login_success(login):
    page = login()
    expect(page).to_have_url(f"{BASE_URL}/inventory.html")
    assert page.locator(".inventory_item").count() > 0

def test_login_invalid_password(login):
    page = login(password="wrong_password")
    expect(page.locator("[data-test='error']")).to_be_visible()
    expect(page).to_have_url(f"{BASE_URL}/")

def test_add_to_cart(logged_in: Page):
    page = logged_in
    page.locator("button:has-text('Add to cart')").first.click()
    expect(page.locator(".shopping_cart_badge")).to_have_text("1")

def test_remove_from_cart(logged_in: Page):
    page = logged_in
    page.locator("button:has-text('Add to cart')").first.click()
    page.click(".shopping_cart_link")
    page.locator("button:has-text('Remove')").first.click()
    expect(page.locator(".shopping_cart_badge")).to_have_count(0)

def test_logout(logged_in: Page):
    page = logged_in
    page.click("#react-burger-menu-btn")
    page.click("#logout_sidebar_link")
    expect(page).to_have_url(f"{BASE_URL}/")

def test_locked_out_user(login):
    page = login(user="locked_out_user")
    expect(page.locator("[data-test='error']")).to_be_visible()
    expect(page).to_have_url(f"{BASE_URL}/")
