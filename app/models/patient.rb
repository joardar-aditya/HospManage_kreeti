 class Patient < ApplicationRecord
     include ActiveModel::Validations 
     validates :name, presence: true
     validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, presence: true, uniqueness: true, if: :can_validate?
     validates :age, presence: true 
     validates :disease, presence: true
     belongs_to :bed, optional: true
     belongs_to :staff, -> { where doctor: true }, optional: true  
     belongs_to :payment, optional: true
     has_many :appointments

    def can_validate?
        true
    end
end
