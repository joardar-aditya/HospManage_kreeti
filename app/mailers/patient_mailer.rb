class PatientMailer < ApplicationMailer
    default from: 'customerhospmanagement@gmail.com'

    def new_registration 
        #Preview it @ http://localhost:3000/rails/mailers/patient_mailer/new_registration.html?locale=en
         @user = params[:user]
         attachments.inline['image.jpg'] = File.read('./public/hospital-image.jpg')
         mail(to: @user.email, subject: "You Have been registered!" )

    end 

    def status_change 
       @user = params[:user]
       attachments.inline['image.jpg'] = File.read('./public/hospital-image.jpg')
       mail(to: @user.email, subject: "Your Status has been changed!")
    end 
end
