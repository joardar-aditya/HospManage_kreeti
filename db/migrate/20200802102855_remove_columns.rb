class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :bedtype
    remove_column :patients, :paymentmethod
    remove_column :patients, :consult
  end
end
