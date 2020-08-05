ActiveAdmin.register Staff do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password_digest, :name, :reset, :designation, :access, :f_pass, :doctor, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :password_digest, :name, :reset, :designation, :access, :f_pass, :doctor, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

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
