class PatientsController < ApplicationController
    include ApplicationHelper
    include PatientsHelper
    before_action :authorize 
    before_action :authenticate_admin_user! , only: [:generateinvoice]

    def new 
      @patient = Patient.new
    end
    
    
    def invoices 
      @patients = Patient.all
    end 

    
    
    respond_to :html, :json, :js

    def sort_patients 
      @patients = Patient.order(:created_at)
      render "index"
    end 

    def create 
        pa = Patient.find_by(email: create_params[:email])
        if pa.nil?
          @patient = Patient.create(create_params)
          @patient.voter_id.attach(params[:voter_id])
            if @patient.valid? && @patient.voter_id.attached?
               add_patient_reference(@patient)
               PatientMailer.with(user: @patient).new_registration.deliver_later
               redirect_to patient_path(@patient)
            else
             render "new" , danger: "Some Error Occured!"
            end
        else 
          redirect_to edit_patient_path(pa), danger: "Already Registered!"
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
    
    respond_to :html, :pdf

    def generateinvoice 
          @patient = Patient.find invoice_params[:id]
          @total = invoice_params[:total]

          respond_to do |format|  
            format.pdf do 
              render pdf: "Invoice4#{@patient.name}",
              page_size: "A4",
              template: "/patients/generateinvoice.html.erb",
              layout: "pdf.html",
              orientation: "Landscape",
              lowquality: true,
              zoom: 1,
              dpi: 75
            end 
            format.html { redirect_to admin_root_path }
          end 
     end      
           
    
    def index 
        #Add Admin roles 
        if current_admin_user != nil 
          if patient_params[:search] == nil && patient_params[:appointment] == nil
            @patients = Patient.all 
          else
            search(patient_params[:search], patient_params[:option], patient_params[:appointment])
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
          
          if @patient.update(create_params)
            redirect_to patient_path(@patient) , success: "Details are updated!"
          else 
            render "edit"
          end 
    end 
    
    def change_status
        @patient = Patient.find(params[:patient_id])
        if @patient.update(update_status)
          PatientMailer.with(user: @patient).status_change.deliver_now
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
        params.require(:patient).permit(:age, :name, :email, :phone, :disease, :genders_id, :dob, :address, :e_con_name, :e_con_phone, :e_con_email, :status, :bedno,:voter_id, :admittedEmerg)
    end 

    def update_status 
        params.require(:patient).permit(:status)
    end

    def patient_params 
      params.permit(:option, :search, :commit, :appointment)
    end 

    def invoice_params 
      params.require(:patient).permit(:total, :id)
    end 

    def sort_params 
      params.permit(:sort)
    end 
end
