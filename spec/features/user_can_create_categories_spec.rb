require 'rails_helper'

RSpec.describe "User can create account" do
  it "user is presented with option to login at homepage" do
    visit '/'
    click_on "Sign Up"

    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
  end

  it "user can create account" do
    visit '/'
    click_on "Sign Up"

    fill_in "First name", with: "Super"
    fill_in "Last name", with: "Girl"
    fill_in "Email", with: "me@email.com"
    fill_in "Username", with: "SuperGirl"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create"

    expect(page).to have_content("Welcome")
  end
end
