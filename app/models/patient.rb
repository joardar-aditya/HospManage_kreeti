
#Custom Validator -: For Bed Type
class BedValidator < ActiveModel::Validator  
    def validate(record) 
        unless Bed.where(name: record.bedtype).present? 
            record.errors[:bed] << 'Enter a valid bed type'
        end
        
    end 

    

end  


#Custom Validator -: For Payment Type 
class PaymentValidator < ActiveModel::Validator  
    def validate(record) 
        unless Payment.where(ptype: record.paymentmethod).present? 
            record.errors[:payment] << 'Enter a valid Payment type'
        end
        
    end 

    

end  


class DoctorValidator < ActiveModel::Validator  
    def validate(record) 
        unless Staff.where(name: record.consult).present? 
            record.errors[:payment] << 'Enter a valid Payment type'
        end
        
    end 

    

end  





class Patient < ApplicationRecord
     include ActiveModel::Validations 
     validates_with BedValidator
     validates_with PaymentValidator
     validates_with DoctorValidator
end
