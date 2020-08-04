class AddDoctorToStaff < ActiveRecord::Migration[6.0]
  def change
    add_column :staffs, :doctor, :boolean
  end
end
