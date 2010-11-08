class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to get_home_page(current_user)
    else
      redirect_to new_user_session_url
    end
  end
  
  private

  def get_home_page(user)
    if user.role?(:admin) || user.role?(:secretary)
      redirection_page = patients_url
    elsif user.role? :dermatology_doctor
      redirection_page = dermatology_patients_url
    elsif user.role? :occupational_therapy_doctor
      redirection_page = occupational_therapy_patients_url
    elsif user.role? :plastic_surgery_doctor
      redirection_page = plastic_surgery_patients_url
    end
    
    redirection_page
  end  
  
end
