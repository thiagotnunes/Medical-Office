class ApplicationController < ActionController::Base
  helper :all
  
  protect_from_forgery
  
  before_filter :authenticate_user!
  before_filter :register_back_page_path, :only => :index
  
  # Defines the back path link
  def register_back_page_path
    session[:back_controller] = controller_name
    session[:back_action] = action_name
  end
  
end
