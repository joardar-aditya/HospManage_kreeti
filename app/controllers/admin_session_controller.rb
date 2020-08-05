class AdminSessionController < ApplicationController 

    def create 
        user = HospAdmin.find_by_email(params[:email]) 
        if user && user.authenticate(params[:password])
            puts "i was called"
            session[:admin] = user.id 
            redirect_to "/admin"
        else 
            redirect_to "/" , danger: "Admin User not allowed!"
        end
    end 

    def destroy 
        session[:admin] = nil 
        redirect_to root_path , danger: "Admin Logged Out!"
    end
end
