class AddSomethingToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :email, :string 
    add_reference :patients, :genders
    add_reference :patients, :appointments
    add_column :patients, :address, :string 
    add_column :patients, :phone, :string 
    add_column :patients, :dob, :date 
    change_column :patients, :age, :string
    add_column :patients, :e_con_name, :string 
    add_column :patients, :e_con_phone, :string 
    add_column :patients, :e_con_email, :string 
    add_column :patients, :status, :string 

    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
