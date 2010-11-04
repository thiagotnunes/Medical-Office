class SecurityEnabledApplicationController < ApplicationController
  
  before_filter :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    render "errors/unauthorized.html", :layout => 'error'
  end
end
