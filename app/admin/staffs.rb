ActiveAdmin.register Staff do
  permit_params :email, :password, :password_confirmation, :name, :doctor, :designation, :access

  form do |f| 
    f.semantic_errors *f.object.errors.keys
    f.inputs "Staff Details" do 
    f.input :email 
    f.input :name 
    f.input :password 
    f.input :password_confirmation
    f.input :doctor
    f.input :designation
    f.input :access
    end 
    f.actions 
  end 
  
end
