class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.where(user_name: params[:user_name]).first

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path @user
      flash[:notice] = "Login was successful"
    else
      flash[:alert] = "Problem logining in"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
