module PatientsHelper
    def search(name, option)
         if option == "Id"
            @patients = Patient.where(id:name.to_i)
         elsif option == "name"
            @patients = Patient.where("name LIKE ?", "%#{name}%") 
         else 
            @patients = Patient.where(email: name)
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
end
