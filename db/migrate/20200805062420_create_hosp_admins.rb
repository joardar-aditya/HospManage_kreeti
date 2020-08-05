class CreateHospAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :hosp_admins do |t|

      t.timestamps
    end
  end
end
