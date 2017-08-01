require 'rails_helper'

RSpec.describe "Admin" do
  it "can admin can create categories" do
    admin = Fabricate(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit 'admin/dashboard'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_button("Create Category")

    fill_in "Title", with: "Ruby"
    click_button "Create Category"

    expect(page).to have_content("Ruby")
    expect(current_path).to eq(admin_dashboard_path)
  end
end
