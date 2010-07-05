class EvolutionsController < ApplicationController

  def index
    @evolutions = Evolution.find(:all)
  end

end
