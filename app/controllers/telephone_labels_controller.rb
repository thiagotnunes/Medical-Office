class TelephoneLabelsController < ApplicationController

  def index
    @telephone_labels = TelephoneLabel.find(:all)
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

    if @telephone_label.save
      flash[:notice] = 'Telephone Label was successfully created.'
      redirect_to(@telephone_label)
    else
      render :action => "new"
    end
  end

  def update
    @telephone_label = TelephoneLabel.find(params[:id])

    if @telephone_label.update_attributes(params[:telephone_label])
      flash[:notice] = 'Telephone Label was successfully updated.'
      redirect_to(@telephone_label)
    else
      render :action => "edit"
    end
  end

  def destroy
    @telephone_label = TelephoneLabel.find(params[:id])
    @telephone_label.destroy

    redirect_to(telephone_labels_url)
  end
end
