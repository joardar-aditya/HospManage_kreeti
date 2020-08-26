class ChangeColumnPatient < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :patients_id, :patient_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
