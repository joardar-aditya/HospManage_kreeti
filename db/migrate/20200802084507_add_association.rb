class AddAssociation < ActiveRecord::Migration[6.0]
  def change
    add_reference :patients, :beds
    add_reference :patients, :payments
    add_reference :patients, :staffs
  end
end
