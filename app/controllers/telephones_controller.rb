class TelephonesController < ApplicationController

  def index
    @telephones = Telephone.find_all_by_patient_id(params[:id])
  end

end
