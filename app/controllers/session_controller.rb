class SessionController < ApplicationController 
  include SessionHelper

    def new 
    end 

    def create 
        user = Staff.find_by_email(params[:email])
        if user
          if user.authenticate(params[:password]) 
              user.update_attribute(:f_pass, false)
              user.update(un_attempt: 0) 
              user_access_check(user)
          else 
             un_attempt = user.un_attempt.to_i + 1
             if(un_attempt < 3)
                user.update(un_attempt: un_attempt)
                flash.now[:danger] = "Log In Failed: #{3-user.un_attempt} attempts left!"
                render "new"
             else
                user.update(access: false)
                flash.now[:danger] = "Maximum limit exceeded, Account Locked!"
                render "new"
             end
          end 
        else
             flash.now[:danger] = "Invalid Credentials, Log In Failed"  
             render "new"  
        end    
    end 

   

    def destroy 
       session[:id] = nil
       session[:admin] = nil
       redirect_to root_path, danger: "Logged out Successfully"
    end 
end
