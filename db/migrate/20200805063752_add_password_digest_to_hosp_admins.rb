class AddPasswordDigestToHospAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :hosp_admins, :password_digest, :string
  end
end
