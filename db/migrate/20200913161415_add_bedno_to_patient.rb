class AddBednoToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :bedno, :integer
  end
end
