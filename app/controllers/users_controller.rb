class UsersController < ApplicationController

def index
    @user = User.all
#    #checks to see if there is a user logged in
#    current_user
end

def new
    @user = User.new
end

def show
    @user = User.find(params[:id])
end

def create
    @user = User.new(user_params)
    if @user.save
        redirect_to login_path
    else
        render 'new'
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
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
