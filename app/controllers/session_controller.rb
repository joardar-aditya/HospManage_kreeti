class SessionController < ApplicationController 
  include SessionHelper

    def new 
    end 

    def create 
        user = Staff.find_by_email(params[:email])
        if user && user.authenticate(params[:password]) 
           user.update_attribute(:f_pass, false) 
           user_access_check(user)
        else
             flash.now[:danger] = "Invalid Credentials, Log In Failed"  
             render "new"  
        end    
    end 

   

    def destroy 
       session[:id] = nil
       session[:admin] = nil
       redirect_to "/", danger: "Logged out Successfully"
    end 
end
