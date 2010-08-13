class DermatologyPatientsController < ApplicationController

  def index
    @patients = DermatologyPatient.all
  end

  def show
    @patient = DermatologyPatient.find(params[:id])
  end

  def new
    @patient = DermatologyPatient.new
    
    # Calculates the latest record number for insertion
    record = DermatologyPatient.maximum(:record)
    @patient.record = record.nil? ? 0 : record + 1
    
    @patient.addresses.build
    @patient.evolutions.build
    @patient.patient_histories.build
    @patient.telephones.build
  end

  def edit
    @patient = DermatologyPatient.find(params[:id])
    
    @patient.evolutions.build if @patient.evolutions.empty?
    @patient.patient_histories.build if @patient.patient_histories.empty?
  end

  def create
    @patient = DermatologyPatient.new(params[:dermatology_patient])

    if params[:commit] == "Cancel"
      redirect_to(dermatology_patients_url)
    elsif @patient.save
      flash[:notice] = 'Patient was successfully created.'
      redirect_to(@patient)
    else
      @patient.evolutions.build if @patient.evolutions.empty?
      @patient.patient_histories.build if @patient.patient_histories.empty?
      render :action => "new"
    end
  end

  def update
    if params[:commit] == "Cancel"
      redirect_to(dermatology_patients_url)
    else
      # To overcome the bug of not editing/destroying associated nested attributes it is necessary
      # to load these associations when the patient is loaded
      # For more information see https://rails.lighthouseapp.com/projects/8994/tickets/4766-nested_attributes-fails-to-updatedestroy-when-association-is-loaded-between-setting-attributes-and-saving-parent
      @patient = DermatologyPatient.find(params[:id], :include => [:addresses, :evolutions, :patient_histories, :patient_pictures, :telephones])

      if @patient.update_attributes(params[:dermatology_patient])
        flash[:notice] = 'Patient was successfully updated.'
        redirect_to(@patient)
      else
        @patient.evolutions.build if @patient.evolutions.empty?
        @patient.patient_histories.build if @patient.patient_histories.empty?
        render :action => "edit"
      end
    end
  end

  def destroy
    @patient = DermatologyPatient.find(params[:id])
    @patient.destroy

    redirect_to(dermatology_patients_url)
  end
  
end
