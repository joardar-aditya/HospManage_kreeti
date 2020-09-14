module PatientsHelper
    def search(name, option, date)
         @patients = Patient.all 
         if date.to_s != "" 
           @patients =  Patient.joins(:appointments).where(appointments: {Date: date})

         end 
         if option == "Id" 
              if name != nil
                 @patients = @patients.where("ref_num LIKE ?", "#{name}")
              end
         elsif option == "name"
            if name != nil 
               @patients = @patients.where("name LIKE ?", "%#{name}%")
            end  
         else 
            if name != nil 
                  @patients = @patients.where("dob LIKE ?", "%#{name}%")
            end 
         end 
    end 

    def search_staff(name, option, id)
        if option == "id"
            @patients = Patient.where(id: name.to_i,staff_id: id )
        elsif option == "name"
            @patients = Patient.where("name LIKE ? AND staff_id = ?", "%#{name}%", id)
        else 
            @patients = Patient.where(email: name, staff_id: id)
        end     
    end 

    def add_patient_reference(patient)
         ref = "REF"
         if patient.id < 10 
             ref += "00" + patient.id.to_s 
         elsif patient.id < 100 
             ref += "0" + patient.id.to_s 
         else 
            ref += patient.id.to_s
         end 
         patient.update(ref_num: ref)
         puts patient.ref_num
         
    end 
end
