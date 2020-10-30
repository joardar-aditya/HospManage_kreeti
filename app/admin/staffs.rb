ActiveAdmin.register Staff do

  permit_params :email, :password, :password_confirmation, :name, :reset, :designation, :access, :f_pass, :doctor, :admin
  
  controller do 
    def update 
           puts params[:staff][:email]
         staff = Staff.find_by_email(params[:staff][:email])
         puts allow_params
         if staff.update!(allow_params)
          flash.now[:success] = "Staff Updated!"
           redirect_to admin_staff_path 
         else 
          flash.now[:danger] = "Operation failed!"
            render :edit
         end
    end 
    
    private 
    def allow_params
       if params[:staff][:password].nil?
        params.require(:staff).permit(:email, :name, :reset, :designation, :access,  :doctor, :admin)
       else
        params.require(:staff).permit(:email, :name, :reset, :designation, :access, :password, :password_confirmation, :doctor, :admin)
      end 
    end
  end



  

  form do |f| 
    f.semantic_errors *f.object.errors.keys
    f.inputs "Staff Details" do 
    f.input :email 
    f.input :name 
    if f.object.password_digest.nil?
      f.input :password 
      f.input :password_confirmation
    end  
    f.input :doctor
    f.input :designation
    f.input :access
    f.input :admin
    if f.object.f_pass 
      para "The User has forgetten Password!"
      f.input :password 
      f.input :password_confirmation
    end
    f.input :reset, label: 'ask to reset password'
    end 
    f.actions 
  end 
end
