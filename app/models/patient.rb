 class Patient < ApplicationRecord
     include ActiveModel::Validations 
     has_one_attached :voter_id
     validates :name, presence: true
     validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, presence: true, uniqueness: true, if: :can_validate?
     validates :age, presence: true 
     validates :disease, presence: true
     belongs_to :bed, optional: true
     belongs_to :staff, -> { where doctor: true }, optional: true  
     belongs_to :payment, optional: true
     has_many :appointments
     validates :phone, presence: true, format: { with: /\d{10}/}
     scope :search_refno, -> (name) { where("ref_num LIKE ?", "%#{name}%") }
     scope :search_name, -> (name) { where("name LIKE ?", "%#{name}%")}
     scope :search_dob, -> (name) { where("dob LIKE ?", "%#{name}%") }


    def can_validate?
        true
    end
end
