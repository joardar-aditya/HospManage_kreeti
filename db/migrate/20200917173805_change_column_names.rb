class ChangeColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :patients, :admittedEmerg, :admit_emergency
    rename_column :patients, :bedno, :bed_no 
    rename_column :payments, :paymenttype, :payment_type
    remove_column :staffs, :admittedEmerg

    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
