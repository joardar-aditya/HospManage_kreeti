class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :ds
      t.boolean :admitted
      t.string :bedtype
      t.string :paymentmethod
      t.string :consult

      t.timestamps
    end
  end
end
