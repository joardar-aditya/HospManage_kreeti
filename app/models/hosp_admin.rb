class HospAdmin < ApplicationRecord
    has_secure_password
    validates :email, format: { with: /\A^(.+)@(.+)$+\z/,
        message: "E-mail invalid" }
    validates :email, length: { in: 5..1000 }  
    validates :email, uniqueness: true
    validates :name, presence: true
    validates :email, presence: true 
    validates :password, length: { minimum: 6 }, :on => :save
end
