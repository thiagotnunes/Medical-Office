class OccupationalTherapyPatientsController < ApplicationController

    def index
    @patients = OccupationalTherapyPatient.all
  end

  def show
    @patient = OccupationalTherapyPatient.find(params[:id])
  end

  def new
    @patient = OccupationalTherapyPatient.new
  end

  def edit
    @patient = OccupationalTherapyPatient.find(params[:id])
  end

  def create
    @patient = OccupationalTherapyPatient.new(params[:patient])

    if @patient.save
      flash[:notice] = 'Patient was successfully created.'
      redirect_to(@patient)
    else
      render :action => "new"
    end
  end

  def update
    @patient = OccupationalTherapyPatient.find(params[:id])

    if @patient.update_attributes(params[:patient])
      flash[:notice] = 'Patient was successfully updated.'
      redirect_to(@patient)
    else
      render :action => "edit"
    end
  end

  def destroy
    @patient = OccupationalTherapyPatient.find(params[:id])
    @patient.destroy

    redirect_to(OccupationalTherapy_patients_url)
  end
  
end
