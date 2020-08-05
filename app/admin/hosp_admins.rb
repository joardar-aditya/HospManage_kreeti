ActiveAdmin.register HospAdmin do

 
  permit_params :email, :name, :password , :password_confirmation 


  form do |f| 
    f.semantic_errors *f.object.errors.keys
    f.inputs "Staff Details" do 
    f.input :email 
    f.input :name 
    f.input :password 
    f.input :password_confirmation
    end 
    f.actions 
  end 
 
  
end
