class TelephonesController < ApplicationController
  # GET /telephones
  # GET /telephones.xml
  def index
    @telephones = Telephone.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @telephones }
    end
  end
end
