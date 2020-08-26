class AddAssociationToPatients < ActiveRecord::Migration[6.0]
  def change
    add_reference :appointments, :patients
    remove_column :patients, :appointments_id
  end
end
