class SessionsController < ApplicationController
    
    
    
    def new
    end
    
    
    
    def create
        user = User.find_by(username: params[:session][:username].downcase)
        #if there is a user and password is correct
        if user && user.authenticate(params[:session][:password])
            #stay logged in while surfing other pages
            
        else
            flash.now[:danger] = 'Invalid email/password combination'
            #if credentials don't match send back
            render 'new'
        end
    end
    
    
    
    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end
    
    
    
end