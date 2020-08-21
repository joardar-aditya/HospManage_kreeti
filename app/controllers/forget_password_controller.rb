class ForgetPasswordController < ApplicationController
    def index 
    end 

    def forgetp
        @user = Staff.find_by_email(params[:email])
        if @user 
            if  @user.update_attribute(:f_pass, true) 
              redirect_to "/", success: "Admin notified! Your new password would be set soon!"
            else 
               redirect_to "/forget_password", danger: "Error!"
            end 
        else 
            redirect_to "/forget_password", danger: "E-mail not found!"
        end 
    end 




  
end
