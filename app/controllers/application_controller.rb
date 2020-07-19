class ApplicationController < ActionController::Base
    add_flash_types :success, :danger
    helper_method :current_user 
    helper_method :authorize
    def current_user 
        if session[:id]
            @current_user ||= Staff.find(session[:id])
        else 
            @current_user = nil 
        end 
    end
    
    def authorize 
        if current_user != nil 
            return true 
        else 
            redirect_to  "/", danger: "Not allowed! Log in first"
        end 
    end
    

end
