class ChangeDobDatatype < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :dob, :string
  end
end
