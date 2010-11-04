class PatientsController < SecurityEnabledApplicationController

  #load_and_authorize_resource

  def index
    @patients = Patient.all
  end
  
  def new
    redirect_to params[:profile][:url]
  end
  
end
