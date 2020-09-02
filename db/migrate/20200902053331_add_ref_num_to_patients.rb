class AddRefNumToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :ref_num, :string
  end
end
