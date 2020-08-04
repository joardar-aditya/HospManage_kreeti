class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :staffs, :forgotp, :forget_password
    rename_column :staffs, :design, :designation
    rename_column :payments, :ptype, :paymenttype
    rename_column :patients, :ds, :disease
    rename_column :beds, :pricepd, :price_per_day 
  end
end