class AddEmailToHospAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :hosp_admins, :email, :string
  end
end
