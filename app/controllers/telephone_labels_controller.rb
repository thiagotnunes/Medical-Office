class TelephoneLabelsController < ApplicationController
  # GET /telephone_labels
  # GET /telephone_labels.xml
  def index
    @telephone_labels = TelephoneLabel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @telephone_labels }
    end
  end

  # GET /telephone_labels/1
  # GET /telephone_labels/1.xml
  def show
    @telephone_label = TelephoneLabel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @telephone_label }
    end
  end

  # GET /telephone_labels/new
  # GET /telephone_labels/new.xml
  def new
    @telephone_label = TelephoneLabel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @telephone_label }
    end
  end

  # GET /telephone_labels/1/edit
  def edit
    @telephone_label = TelephoneLabel.find(params[:id])
  end

  # POST /telephone_labels
  # POST /telephone_labels.xml
  def create
    @telephone_label = TelephoneLabel.new(params[:telephone_label])

    respond_to do |format|
      if @telephone_label.save
        flash[:notice] = 'TelephoneLabel was successfully created.'
        format.html { redirect_to(@telephone_label) }
        format.xml  { render :xml => @telephone_label, :status => :created, :location => @telephone_label }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @telephone_label.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /telephone_labels/1
  # PUT /telephone_labels/1.xml
  def update
    @telephone_label = TelephoneLabel.find(params[:id])

    respond_to do |format|
      if @telephone_label.update_attributes(params[:telephone_label])
        flash[:notice] = 'TelephoneLabel was successfully updated.'
        format.html { redirect_to(@telephone_label) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @telephone_label.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /telephone_labels/1
  # DELETE /telephone_labels/1.xml
  def destroy
    @telephone_label = TelephoneLabel.find(params[:id])
    @telephone_label.destroy

    respond_to do |format|
      format.html { redirect_to(telephone_labels_url) }
      format.xml  { head :ok }
    end
  end
end
