require 'rails_helper'

RSpec.describe "Registered User" do
  it "can add an idea" do
    user = Fabricate(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
  end
end
