class StaffsController < ApplicationController

    before_action :authorize 
    def edit 
       @staff = Staff.find(session[:id])
    end 

    def show 
      
    end

    def update 
     @staff = Staff.find(session[:id])
     @staff.update(permit_params)
     if @staff.save
        redirect_to "/", success: "Password Updated Successfully"
     else 
        flash.now[:danger] = "Operation failed!"
        render "edit"   
     end

    end 
    
    private 
     def permit_params 
        params.require(:staff).permit(:password, :password_confirmation, :reset)
     end 
end
