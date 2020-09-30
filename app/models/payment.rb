class Payment < ApplicationRecord
    validates :payment_type, presence: true
    has_many :patient, dependent: :destroy
end
