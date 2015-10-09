class SessionsController < ApplicationController
  def new
  end

  def create
    user = Author.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login successful."
    else
      flash.now[:notice] = "Invalid username and password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logout successful."
  end
end
