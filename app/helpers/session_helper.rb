module SessionHelper

    def user_access_check user 
        if user.access 
           if user.admin
              session[:admin] = user.id 
           end   
           session[:id] = user.id 
           if !user.reset 
             redirect_to patients_path , success: "Logged in Successful!"
           else  
             redirect_to edit_staff_path(user.id), danger: "Please reset your Password"
            end
        else
           flash.now[:danger] = "Access Not Allowed! Contact Admin!"
           render "new"
        end
    end
    
end
