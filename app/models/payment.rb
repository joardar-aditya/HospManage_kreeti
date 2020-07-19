class Payment < ApplicationRecord
    validates :ptype, presence: true
end
