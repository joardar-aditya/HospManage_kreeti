class ChangePatientColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :patients, :staffs_id, :staff_id
    rename_column :patients, :beds_id, :bed_id
    rename_column :patients, :payments_id, :payment_id

    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
