require 'rails_helper'

RSpec.describe "Admin" do
  it "can edit a category" do
    admin = Fabricate(:user, role: 1)
    category = Fabricate(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit 'admin/dashboard'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_link("Edit")

    click_link "Edit"

    expect(current_path).to eq(edit_category_path(category))

    fill_in "Title", with: "Netflix"
    click_button "Update Category"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Netflix")
    expect(page).to_not have_content(category.title)
  end

end
