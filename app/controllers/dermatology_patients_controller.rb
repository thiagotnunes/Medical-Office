class DermatologyPatientsController < ApplicationController

    def index
    @patients = DermatologyPatient.find(:all)
  end

  def show
    @patient = DermatologyPatient.find(params[:id])
  end

  def new
    @patient = DermatologyPatient.new
  end

  def edit
    @patient = DermatologyPatient.find(params[:id])
  end

  def create
    @patient = DermatologyPatient.new(params[:patient])

    if @patient.save
      flash[:notice] = 'Patient was successfully created.'
      redirect_to(@patient)
    else
      render :action => "new"
    end
  end

  def update
    @patient = DermatologyPatient.find(params[:id])

    if @patient.update_attributes(params[:patient])
      flash[:notice] = 'Patient was successfully updated.'
      redirect_to(@patient)
    else
      render :action => "edit"
    end
  end

  def destroy
    @patient = DermatologyPatient.find(params[:id])
    @patient.destroy

    redirect_to(Dermatology_patients_url)
  end
  
end
