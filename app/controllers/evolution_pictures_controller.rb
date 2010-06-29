class EvolutionPicturesController < ApplicationController
  # GET /evolution_pictures
  # GET /evolution_pictures.xml
  def index
    @evolution_pictures = EvolutionPicture.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @evolution_pictures }
    end
  end

  # GET /evolution_pictures/1
  # GET /evolution_pictures/1.xml
  def show
    @evolution_picture = EvolutionPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @evolution_picture }
    end
  end

  # GET /evolution_pictures/new
  # GET /evolution_pictures/new.xml
  def new
    @evolution_picture = EvolutionPicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @evolution_picture }
    end
  end

  # GET /evolution_pictures/1/edit
  def edit
    @evolution_picture = EvolutionPicture.find(params[:id])
  end

  # POST /evolution_pictures
  # POST /evolution_pictures.xml
  def create
    @evolution_picture = EvolutionPicture.new(params[:evolution_picture])

    respond_to do |format|
      if @evolution_picture.save
        flash[:notice] = 'EvolutionPicture was successfully created.'
        format.html { redirect_to(@evolution_picture) }
        format.xml  { render :xml => @evolution_picture, :status => :created, :location => @evolution_picture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @evolution_picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /evolution_pictures/1
  # PUT /evolution_pictures/1.xml
  def update
    @evolution_picture = EvolutionPicture.find(params[:id])

    respond_to do |format|
      if @evolution_picture.update_attributes(params[:evolution_picture])
        flash[:notice] = 'EvolutionPicture was successfully updated.'
        format.html { redirect_to(@evolution_picture) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @evolution_picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /evolution_pictures/1
  # DELETE /evolution_pictures/1.xml
  def destroy
    @evolution_picture = EvolutionPicture.find(params[:id])
    @evolution_picture.destroy

    respond_to do |format|
      format.html { redirect_to(evolution_pictures_url) }
      format.xml  { head :ok }
    end
  end
end
