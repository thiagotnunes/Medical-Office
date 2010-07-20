class PlasticSurgeryPatientsController < PatientsController

    def index
    @patients = PlasticSurgeryPatient.find(:all)
  end

  def show
    @patient = PlasticSurgeryPatient.find(params[:id])
  end

  def new
    @patient = PlasticSurgeryPatient.new
  end

  def edit
    @patient = PlasticSurgeryPatient.find(params[:id])
  end

  def create
    @patient = PlasticSurgeryPatient.new(params[:patient])

    if @patient.save
      flash[:notice] = 'Patient was successfully created.'
      redirect_to(@patient)
    else
      render :action => "new"
    end
  end

  def update
    @patient = PlasticSurgeryPatient.find(params[:id])

    if @patient.update_attributes(params[:patient])
      flash[:notice] = 'Patient was successfully updated.'
      redirect_to(@patient)
    else
      render :action => "edit"
    end
  end

  def destroy
    @patient = PlasticSurgeryPatient.find(params[:id])
    @patient.destroy

    redirect_to(patients_url)
  end
  
end
