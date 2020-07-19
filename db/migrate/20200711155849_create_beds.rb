class CreateBeds < ActiveRecord::Migration[6.0]
  def change
    create_table :beds do |t|
      t.string :name
      t.integer :pricepd

      t.timestamps
    end
  end
end
