class AppointmentsController < ApplicationController
    def new 
         @patient = Patient.find(params[:patient_id])
         @appointment = Appointment.new 
    end 

    def create 
        @patient = Patient.find(params[:patient_id])
        @appointment = @patient.appointments.create(add_app)
        if @appointment.save!
            redirect_to "/patients", success: "Appointment Added"
        else 
            render "new"
        end 
    end 
    
    private 

    def add_app 
          params.require(:appointment).permit(:Date, :Time)
    end 
    
end
