require 'rails_helper'

RSpec.describe "Admin" do
  it "can delete a category" do
    admin = Fabricate(:user, role: 1)
    category = Fabricate(:category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit 'admin/dashboard'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_link("Delete")

    click_link "Delete"

    expect(current_path).to eq(admin_dashboard_path)
  end
end
