class UnsuccessfulLoginToStaff < ActiveRecord::Migration[6.0]
  def change
    add_column :staffs, :un_attempt, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
