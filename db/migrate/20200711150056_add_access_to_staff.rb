class AddAccessToStaff < ActiveRecord::Migration[6.0]
  def change
    add_column :staffs, :access, :boolean
  end
end
