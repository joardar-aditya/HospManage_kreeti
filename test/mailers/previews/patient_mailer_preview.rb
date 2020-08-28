# Preview all emails at http://localhost:3000/rails/mailers/patient_mailer
class PatientMailerPreview < ActionMailer::Preview

    def new_registration 
          PatientMailer.with(user: Patient.fifth).new_registration
    end 

end
