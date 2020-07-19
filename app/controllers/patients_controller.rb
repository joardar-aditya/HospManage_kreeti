class PatientsController < ApplicationController
    before_action :authorize 
    def edit 
        
    end
    
    def index 
        @patients = Patient.all.where(consult: current_user.name)
    end 

    def show 
        @patient = Patient.find(params[:id])
    end 


end
