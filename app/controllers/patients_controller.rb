class PatientsController < ApplicationController

  def index
    @patients = Patient.all
    @profile = Profile.new
  end
  
end
