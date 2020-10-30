class Appointment < ApplicationRecord
    belongs_to :patient
    validates :date, presence: true
    validates :time, presence: true, format: { with: /\A([0-1]?[0-9]|2[0-3]):[0-5][0-9]\z/ , message: "format HH:MM"}
end
