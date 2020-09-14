class AddAdmittedEmergToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :admittedEmerg, :boolean
  end
end
