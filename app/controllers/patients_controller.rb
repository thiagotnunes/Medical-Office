class PatientsController < SecurityEnabledApplicationController

  def index
    @patients = Patient.all
  end
  
  def new
    redirect_to params[:profile][:url]
  end
  
end
