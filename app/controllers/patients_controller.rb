class PatientsController < ApplicationController
    before_action :authorize 
    def edit 
        
    end
    
    def index 
        @patients = Patient.all.where(consult: current_user.name)
        if current_user.role.to_s == "Support"
            @patients = Patient.all 
        end
    end 

    def show 
        @patient = Patient.find(params[:id])
    end 


end
