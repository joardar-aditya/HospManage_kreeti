class AppointmentsController < ApplicationController
    def new 
         @patient = Patient.find(params[:patient_id])
         @appointment = Appointment.new 
    end 

    def create 
        @patient = Patient.find(params[:patient_id])
        @appointment = @patient.appointments.create(add_app)
        if @appointment.errors.any?
            render "new", danger: "Appointment not created"
        else 
            redirect_to "/patients/#{@patient.id}", success: "Appointment Added"
        end 
    end 
    
    private 

    def add_app 
          params.require(:appointment).permit(:date, :time)
    end 
    
end
