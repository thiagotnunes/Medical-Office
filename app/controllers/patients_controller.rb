class PatientsController < ApplicationController

  PATIENTS_PROFILES = [ 
    PatientProfile.new('lalalal', 'Plastic Surgery Patient') 
  ]

  def index
    @patients = Patient.all
  end
  
  def new
    profile = params[:profile]
    redirect_to patients_path
  end
  
end
