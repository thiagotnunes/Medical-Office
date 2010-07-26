class PlasticSurgeryPatientsController < ApplicationController

  def index
    @patients = PlasticSurgeryPatient.find(:all)
  end

  def show
    @patient = PlasticSurgeryPatient.find(params[:id])
  end

  def new
    @patient = PlasticSurgeryPatient.new
    @patient.telephones.build
    @patient.addresses.build
  end

  def edit
    @patient = PlasticSurgeryPatient.find(params[:id])
  end

  def create
    @patient = PlasticSurgeryPatient.new(params[:plastic_surgery_patient])

    if @patient.save
      flash[:notice] = 'Patient was successfully created.'
      redirect_to(@patient)
    else
      render :action => "new"
    end
  end

  def update
    @patient = PlasticSurgeryPatient.find(params[:id])

    if @patient.update_attributes(params[:plastic_surgery_patient])
      flash[:notice] = 'Patient was successfully updated.'
      redirect_to(@patient)
    else
      render :action => "edit"
    end
  end

  def destroy
    @patient = PlasticSurgeryPatient.find(params[:id])
    @patient.destroy

    redirect_to(plastic_surgery_patients_url)
  end
  
end
