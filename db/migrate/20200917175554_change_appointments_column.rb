class ChangeAppointmentsColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :Date, :date
    rename_column :appointments, :Time, :time 
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
