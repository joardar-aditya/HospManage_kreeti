class AddAdmittedEmergToStaff < ActiveRecord::Migration[6.0]
  def change
    add_column :staffs, :admittedEmerg, :boolean
  end
end
