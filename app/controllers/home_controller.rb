class HomeController < ApplicationController

  def index
    if user_signed_in?
      session[:menu_items] = build_menu_items(current_user)
      redirect_to get_home_page(current_user)
    else
      session[:menu_items] = []
      redirect_to new_user_session_url
    end
  end
  
  private
  
  def build_menu_items(user)
    items = []
    if user.role? :admin
      items << MenuItem.new("Address Labels", address_labels_url)
      items << MenuItem.new("Health Insurances", health_insurances_url)
      items << MenuItem.new("Patients", patients_url)
      items << MenuItem.new("Telephone Labels", telephone_labels_url)
    elsif user.role? :secretary
      items << MenuItem.new("Patients", patients_url)
    elsif user.role? :dermatology_doctor
      items << MenuItem.new("Patients", dermatology_patients_url)
    elsif user.role? :occupational_therapy_doctor
      items << MenuItem.new("Patients", occupational_therapy_patients_url)
    elsif user.role? :plastic_surgery_doctor
      items << MenuItem.new("Patients", plastic_surgery_patients_url)
    end
    items
  end

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
