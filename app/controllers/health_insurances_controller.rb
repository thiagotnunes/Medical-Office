class HealthInsurancesController < SecurityEnabledApplicationController

  load_and_authorize_resource

  def index
    @health_insurances = HealthInsurance.all
  end

  def show
    @health_insurance = HealthInsurance.find(params[:id])
  end

  def new
    @health_insurance = HealthInsurance.new
  end

  def edit
    @health_insurance = HealthInsurance.find(params[:id])
  end

  def create
    @health_insurance = HealthInsurance.new(params[:health_insurance])

    if params[:commit] == "Cancel"
      redirect_to(health_insurances_url)
    elsif @health_insurance.save
      flash[:notice] = 'Health Insurance was successfully created.'
      redirect_to(@health_insurance)
    else
      render :action => "new"
    end
  end

  def update
    if params[:commit] == "Cancel"
      redirect_to(health_insurances_url)
    else
      @health_insurance = HealthInsurance.find(params[:id])

      if @health_insurance.update_attributes(params[:health_insurance])
        flash[:notice] = 'Health Insurance was successfully updated.'
        redirect_to(@health_insurance)
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @health_insurance = HealthInsurance.find(params[:id])
    @health_insurance.destroy

    redirect_to(health_insurances_url)
  end
end
