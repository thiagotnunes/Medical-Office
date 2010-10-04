class PatientHistoryLabelsController < ApplicationController

  def index
    @patient_history_labels = PatientHistoryLabel.all
  end

  def show
    @patient_history_label = PatientHistoryLabel.find(params[:id])
  end

  def new
    @patient_history_label = PatientHistoryLabel.new
  end

  def edit
    @patient_history_label = PatientHistoryLabel.find(params[:id])
  end

  def create
    @patient_history_label = PatientHistoryLabel.new(params[:patient_history_label])

    if params[:commit] == "Cancel"
      redirect_to(patient_history_labels_url)
    elsif @patient_history_label.save
      flash[:notice] = 'Patient History Label was successfully created.'
      redirect_to(@patient_history_label)
    else
      render :action => "new"
    end
  end

  def update
    if params[:commit] == "Cancel"
      redirect_to(patient_history_labels_url)
    else
      @patient_history_label = PatientHistoryLabel.find(params[:id])

      if @patient_history_label.update_attributes(params[:patient_history_label])
        flash[:notice] = 'Patient History Label was successfully updated.'
        redirect_to(@patient_history_label)
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @patient_history_label = PatientHistoryLabel.find(params[:id])
    @patient_history_label.destroy

    redirect_to(patient_history_labels_url)
  end
end
