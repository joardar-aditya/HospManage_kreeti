class ApplicationController < ActionController::Base
    add_flash_types :success, :danger
    helper_method :current_admin_user
    helper_method :authenticate_admin_user!

    def authenticate_admin_user!
       if session[:admin] == nil
          redirect_to login_path , danger: "only Admins Allowed"
       end
    end

    def current_admin_user
       session[:admin]
    end 
  
end
