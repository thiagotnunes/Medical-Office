class EvolutionsController < ApplicationController

  def index
    @evolutions = Evolution.find_all_by_patient_id(params[:id])
  end

end
