class SecurityEnabledApplicationController < ApplicationController
  
  before_filter :authenticate_user!
  
  load_and_authorize_resource
  
  rescue_from CanCan::AccessDenied do |exception|
    render "errors/unauthorized.html", :layout => 'error'
  end
end
