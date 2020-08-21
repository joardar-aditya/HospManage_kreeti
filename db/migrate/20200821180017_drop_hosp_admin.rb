class DropHospAdmin < ActiveRecord::Migration[6.0]
  def change
    drop_table :hosp_admins
  end
end
