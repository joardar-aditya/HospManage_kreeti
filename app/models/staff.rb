class Staff < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :role, presence: true 
  validates :email, presence: true 
  validates :password_digest, presence: true 
end
