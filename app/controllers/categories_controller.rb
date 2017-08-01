class CategoriesController < ApplicationController
  before_action :admin?
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "A new category has been created."
      redirect_to admin_dashboard_path
    else
      flash[:warning] = "Please try again."
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    if @category.save
      flash[:notice] = "Your category has been updated"
      redirect_to admin_dashboard_path
    else
      flash[:warning] = "Please try again."
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash.now[:success] = "The category has been deleted."
    redirect_to admin_dashboard_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
