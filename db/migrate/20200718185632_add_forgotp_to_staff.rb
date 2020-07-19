class AddForgotpToStaff < ActiveRecord::Migration[6.0]
  def change
    add_column :staffs, :forgotp, :boolean
  end
end
