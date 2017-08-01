class Admin::UsersController < ApplicationController
  before_action :admin?

  def show
    @categories = Category.all
  end
end
