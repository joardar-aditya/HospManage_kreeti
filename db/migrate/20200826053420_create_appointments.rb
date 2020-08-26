class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :Date
      t.string :Time

      t.timestamps
    end
  end
end
