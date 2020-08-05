class AddNameToHospAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :hosp_admins, :name, :string
  end
end
