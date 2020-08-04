class Payment < ApplicationRecord
    validates :paymenttype, presence: true
    has_many :patient, dependent: :destroy
end
