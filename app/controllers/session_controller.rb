class SessionController < ApplicationController

    def new 
    end 

    def create 
        user = Staff.find_by_email(params[:email])
        if user && user.authenticate(params[:password]) 
           user.update(f_pass: false)
             user.save
             if user.access 
               session[:id] = user.id 
               if user.reset 
                 redirect_to patients_path , success: "Logged in Successful!"
               else  
                 redirect_to edit_staff_path(user.id), danger: "Please reset your Password"
               end
             else
               flash.now[:danger] = "Access Not Allowed! Contact Admin!"
               render "new"
             end  
         
        else
             flash.now[:danger] = "Invalid Credentials, Log In Failed"  
             render "new"  
        end    
    end 

   

    def destroy 
       session[:id] = nil
       redirect_to "/", danger: "Logged out Successfully"
    end 
end
