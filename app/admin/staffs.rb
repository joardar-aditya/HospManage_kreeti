ActiveAdmin.register Staff do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :password_confirmation, :name, :role, :design, :access

  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :password_digest, :name, :role, :reset, :design]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted


  filter :email 
  filter :role 
  filter :design

  form do |f| 
    f.inputs "Staff Details" do 
    f.input :email 
    f.input :name 
    f.input :password 
    f.input :password_confirmation
    f.input :role 
    f.input :design
    f.input :access
    end 
    f.actions 
  end 
  
end
