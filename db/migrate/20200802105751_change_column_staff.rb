class ChangeColumnStaff < ActiveRecord::Migration[6.0]
  def change
    remove_column :staffs, :role
  end
end
