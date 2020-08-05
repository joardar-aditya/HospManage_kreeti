class AddAdminToStaff < ActiveRecord::Migration[6.0]
  def change
    add_column :staffs, :admin, :boolean
  end
end
