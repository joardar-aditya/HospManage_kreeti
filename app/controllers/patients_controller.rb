class PatientsController < ApplicationController
    include ApplicationHelper
    before_action :authorize 

    def new 
      @patient = Patient.new
    end 

    def create 
        @patient = Patient.create(create_params)
        if @patient.save! 
          redirect_to patient_path(@patient) , success: "New Patient Added!"
        else 
          flash.now[:danger] = "Error!"  
          render "new" 
        end 
    end
    
    def index 
        #Add Admin roles 
        if current_admin_user != nil 
            @patients = Patient.all
        else
          if !current_user.doctor
            @patients = Patient.all
          else 
            @patients = Patient.all.where(staff_id: current_user.id)
          end 
        end
    end 

    def edit 
      @patient = Patient.find(params[:id])
    end

    def update 
          @patient = Patient.find(params[:id])
          
          if @patient.update(permit_params)
            redirect_to patient_path(@patient) , success: "Details are updated!"
          else 
            redirect_to edit_patient_path(@patient), danger: "Error!"
          end 
    end 
    
    def change_status
        @patient = Patient.find(params[:patient_id])
        if @patient.update(update_status)
          redirect_to patient_path(@patient.id), success: "Done!"
        else
          redirect_to patient_path(@patient.id), danger: "Not Done!"
      end
    end 


    def show 
        @patient = Patient.find(params[:id])
        @appointments = @patient.appointments.all
    end 

    private 
    def permit_params 
        params.require(:patient).permit(:name, :age, :admitted, :disease)
    end 

    def create_params 
        params.require(:patient).permit(:age, :name, :email, :phone, :disease, :genders_id, :dob, :address, :e_con_name, :e_con_phone, :e_con_email, :status)
    end 

    def update_status 
        params.require(:patient).permit(:status)
    end

end
