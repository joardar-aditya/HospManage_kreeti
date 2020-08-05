 class Patient < ApplicationRecord
     include ActiveModel::Validations 
     validates :name, presence: true
     validates :age, presence: true 
     validates :disease, presence: true
     validates :staff_id, presence: true
     belongs_to :bed, optional: true
     belongs_to :staff, -> { where doctor: true }, optional: true  
     belongs_to :payment, optional: true
     
end
