class PatientsController < ApplicationController

  PATIENTS_PROFILES = [ 
    PatientProfile.new(:dermatology_patients, :new, 'Dermatology Patient'),
    PatientProfile.new(:occupational_therapy_patients, :new, 'Occupational Therapy Patient'),
    PatientProfile.new(:plastic_surgery_patients, :new, 'Plastic Surgery Patient')
  ]

  def index
    @patients = Patient.all
  end
  
  def new
    redirect_to params[:profile][:url]
  end
  
end
