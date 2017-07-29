class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully."
      if admin?
        redirect_to admin_dashboard_path
      else
        redirect_to user_path(user)
      end
    else
      flash.now[:danger] = "Your login attempt was incorrect. Please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:sucess] = "You are now logged out."
    redirect_to root_path
  end
end
