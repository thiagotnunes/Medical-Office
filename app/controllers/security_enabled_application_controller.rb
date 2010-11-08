class SecurityEnabledApplicationController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :build_menu
  
  load_and_authorize_resource
  
  rescue_from CanCan::AccessDenied do |exception|
    render "errors/unauthorized.html", :layout => 'error'
  end
  
  def build_menu
    unless session[:menu_items]
      user = current_user
      items = []
      if user.role? :admin
        items << MenuItem.new("Address Labels", address_labels_url)
        items << MenuItem.new("Health Insurances", health_insurances_url)
        items << MenuItem.new("Patients", patients_url)
        items << MenuItem.new("Telephone Labels", telephone_labels_url)
        items << MenuItem.new("Users", users_url)
      elsif user.role? :secretary
        items << MenuItem.new("Patients", patients_url)
      elsif user.role? :dermatology_doctor
        items << MenuItem.new("Patients", dermatology_patients_url)
      elsif user.role? :occupational_therapy_doctor
        items << MenuItem.new("Patients", occupational_therapy_patients_url)
      elsif user.role? :plastic_surgery_doctor
        items << MenuItem.new("Patients", plastic_surgery_patients_url)
      end
      items << MenuItem.new("Edit my Password", edit_user_password_path(user))
      session[:menu_items] = items
    end
  end
  
end
