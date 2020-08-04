class ChangeForgetColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :staffs, :forget_password, :forgetPasswordAlert
  end
end
