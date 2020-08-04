class Newforget < ActiveRecord::Migration[6.0]
  def change
    rename_column :staffs, :forgetPasswordAlert, :f_pass
  end
end
