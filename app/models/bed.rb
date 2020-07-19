class Bed < ApplicationRecord
    validates :name, presence: true
    validates :pricepd, presence: true
end
