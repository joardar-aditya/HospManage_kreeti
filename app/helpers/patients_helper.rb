module PatientsHelper
  def add_patient_staff(patient)
    if current_admin_user == nil
      if current_user.doctor
        patient.staff_id = current_user.id
      end
    end
    patient.save 
  end

  def index_patients_admin(search)
    if search == nil 
      @patients = Patient.all 
    else
      @patients = Patient.search_patient(search)
    end  
  end

  def index_patient_others(search)
    if !current_user.doctor
      if search == nil 
       @patients = Patient.all
      else 
       @patients = Patient.search_patient(search)
      end 
     else 
      if search == nil 
       @patients = Patient.all.where(staff_id: current_user.id)
      else 
       @patients = Patient.search_id(search, current_user.id )
      end
     end 
  end
end
