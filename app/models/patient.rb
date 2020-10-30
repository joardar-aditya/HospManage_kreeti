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

     scope :search_patient, -> (name) { where("name LIKE :name OR ref_num LIKE :name OR dob LIKE :name", name: "%#{name}%")}
     scope :search_id, -> (name, id) { where("name LIKE :name OR ref_num LIKE :name OR dob LIKE :name AND staff_id = :id", name: "%#{name}%", id: "%#{id}%") }


    def can_validate?
      true
    end

    def admit_emergency
      if self.status == "Emergency"
        true
      else 
        false
      end
    end

    after_create do
      if self.ref_num.nil?
        ref = "REF"
        if self.id < 10 
          ref += "00" + self.id.to_s 
        elsif self.id < 100 
          ref += "0" + self.id.to_s 
        else 
          ref += self.id.to_s
        end 
        self.ref_num = ref
        self.save
      end
      PatientMailer.with(user: self).new_registration.deliver_now
    end  
end
