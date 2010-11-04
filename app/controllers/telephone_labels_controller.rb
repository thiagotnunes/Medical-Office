class TelephoneLabelsController < SecurityEnabledApplicationController

  def index
    @telephone_labels = TelephoneLabel.all
  end

  def show
    @telephone_label = TelephoneLabel.find(params[:id])
  end

  def new
    @telephone_label = TelephoneLabel.new
  end

  def edit
    @telephone_label = TelephoneLabel.find(params[:id])
  end

  def create
    @telephone_label = TelephoneLabel.new(params[:telephone_label])

    if params[:commit] == "Cancel"
      redirect_to(telephone_labels_url)
    elsif @telephone_label.save
      flash[:notice] = 'Telephone Label was successfully created.'
      redirect_to(@telephone_label)
    else
      render :action => "new"
    end
  end

  def update
    if params[:commit] == "Cancel"
      redirect_to(telephone_labels_url)
    else
      @telephone_label = TelephoneLabel.find(params[:id])

      if @telephone_label.update_attributes(params[:telephone_label])
        flash[:notice] = 'Telephone Label was successfully updated.'
        redirect_to(@telephone_label)
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @telephone_label = TelephoneLabel.find(params[:id])
    @telephone_label.destroy

    redirect_to(telephone_labels_url)
  end
end
