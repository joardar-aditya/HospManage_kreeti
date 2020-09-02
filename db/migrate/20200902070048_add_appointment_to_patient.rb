class AddAppointmentToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :appointment, :date
  end
end
