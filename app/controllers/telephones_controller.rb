class TelephonesController < ApplicationController

  def index
    @telephones = Telephone.find(:all)
  end

end
