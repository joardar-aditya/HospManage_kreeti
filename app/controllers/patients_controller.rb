class PatientsController < ApplicationController
    include ApplicationHelper
    include PatientsHelper
    before_action :authorize 

    def new 
      @patient = Patient.new
    end 
    
    respond_to :html, :json, :js

    def create 
        @patient = Patient.create(create_params)
        respond_to do |format| 
          if @patient.valid? 
            PatientMailer.with(user: @patient).new_registration.deliver_later
            format.html {redirect_to } 
             format.js { render :template => 'patients/create.js.erb' 
                      }
          else
             flash.now[:danger] = @patient.errors.full_messages
             format.html {render "new"} 
             format.json { render json: @patient.errors } 
          end
          format.json { render json: @patient.errors } 
        end 
    end

    def check_validation_email 
            puts params
            @patient = Patient.find_by_email(params[:email])
            if @patient == nil 
              render json: {alert:200, message: ""}
            else 
              render json: {alert:400, message: "Email already exists"}
            end 
    end 
    
    def index 
        #Add Admin roles 
        if current_admin_user != nil 
          if patient_params[:search] == nil
            @patients = Patient.all
          else
            search(patient_params[:search], patient_params[:option])
          end  
        else
          if !current_user.doctor
           if patient_params[:search] == nil 
            @patients = Patient.all
           else 
            search(patient_params[:search], patient_params[:option])
           end 
          else 
           if patient_params[:search] == nil 
            @patients = Patient.all.where(staff_id: current_user.id)
           else 
            search_staff(patient_params[:search], patient_params[:option], current_user.id )
           end
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

    def patient_params 
      params.permit(:option, :search, :commit)
    end 

end
