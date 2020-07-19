class ChangeColumn < ActiveRecord::Migration[6.0]
  def self.up 
    rename_column :payments, :type, :ptype

  end
end
