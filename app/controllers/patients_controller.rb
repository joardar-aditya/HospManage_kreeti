class PatientsController < ApplicationController
    include ApplicationHelper
    before_action :authorize 
    
    def index 
        #Add Admin roles 
        if current_admin_user != nil 
            @patients = Patient.all
        else
          if !current_user.doctor
            @patients = Patient.all
          else 
            @patients = Patient.all.where(staffs_id: current_user.id)
          end 
        end
    end 

    def edit 
      @patient = Patient.find(params[:id])
    end

    def update 
          @patient = Patient.find(params[:id])
          @patient.update(permit_params)
          if @patient.save! 
            redirect_to patient_path(@patient) , success: "Details are updated!"
          else 
            redirect_to edit_patient_path(@patient), danger: "Error!"
          end 
    end 



    def show 
        @patient = Patient.find(params[:id])
    end 

    private 
    def permit_params 
        params.require(:patient).permit(:name, :age, :admitted, :disease)
    end 


end
