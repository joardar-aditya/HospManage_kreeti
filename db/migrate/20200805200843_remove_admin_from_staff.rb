class RemoveAdminFromStaff < ActiveRecord::Migration[6.0]
  def change
      remove_column :staffs, :admin
  end
end
