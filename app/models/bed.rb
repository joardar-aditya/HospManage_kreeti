class Bed < ApplicationRecord
    validates :name, presence: true
    validates :price_per_day, presence: true
    has_many :patient, dependent: :destroy
end
