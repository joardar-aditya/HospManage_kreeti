class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :role
      t.boolean :reset
      t.string :design

      t.timestamps
    end
    add_index :staffs, :email, unique: true
  end
end
