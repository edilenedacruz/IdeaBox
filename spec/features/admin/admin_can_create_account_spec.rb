require 'rails_helper'

RSpec.describe "Admin" do
  it "an admin can create categories" do
    admin = Fabricate(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit 'admin/dashboard'

    expect(current_path).to eq(admin_dashboard_path)
  end
end
