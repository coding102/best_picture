class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
    else
        flash.now[:danger] = 'Invalid username/password combination'
        render 'new'
    end
end

    def destroy
    end
end














#class SessionsController < ApplicationController
#  def new
#    @user = User.new
#  end
#
#  def create
#    @user = User.where(user_name: params[:user_name]).first
#
#    if @user && @user.authenticate(params[:password])
#      session[:user_id] = @user.id
#      redirect_to user_path @user
#      flash[:notice] = "Login was successful"
#    else
#      flash[:alert] = "Problem logining in"
#      redirect_to root_path
#    end
#  end
#
#  def destroy
#    session[:user_id] = nil
#    redirect_to root_path
#  end
#end
