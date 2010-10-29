class RootController < ApplicationController

  def index
    redirect_to :controller => :patients
  end
  
end
