class UsersController < ApplicationController

  def index
    @user = User.all
    #checks to see if there is a user logged in
    current_user
  end

  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    current_user
  end

  def create
    @user = User.create(user_params)
     if @user.save
      flash[:notice] = "Your account was created successfully."
      session[:user_id] = @user.id
      current_user
      redirect_to user_login_path
     else
      flash[:alert] = "There was a problem saving your account."
      redirect_to new_user_url
     end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    puts "UPDATING"
    puts params
    @user = User.find(params[:id])
    redirect_to user_path @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
