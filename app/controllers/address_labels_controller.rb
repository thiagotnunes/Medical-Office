class AddressLabelsController < ApplicationController
  def index
    @address_labels = AddressLabel.all
  end

  def show
    @address_label = AddressLabel.find(params[:id])
  end

  def new
    @address_label = AddressLabel.new
  end

  def edit
    @address_label = AddressLabel.find(params[:id])
  end

  def create
    @address_label = AddressLabel.new(params[:address_label])

    if params[:commit] == "Cancel"
      redirect_to(address_labels_url)
    elsif @address_label.save
      flash[:notice] = 'Address Label was successfully created.'
      redirect_to(@address_label)
    else
      render :action => "new"
    end
  end

  def update
    if params[:commit] == "Cancel"
      redirect_to(address_labels_url)
    else
      @address_label = AddressLabel.find(params[:id])

      if @address_label.update_attributes(params[:address_label])
        flash[:notice] = 'Address Label was successfully updated.'
        redirect_to(@address_label)
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @address_label = AddressLabel.find(params[:id])
    @address_label.destroy

    redirect_to(address_labels_url)
  end
end
