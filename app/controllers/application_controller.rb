# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b5fcc875ee15233b2222932a282f48ae'
  
  before_filter :authenticate_user!
  before_filter :register_back_page_path, :only => :index
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  # Defines the back path link
  def register_back_page_path
    session[:back_controller] = controller_name
    session[:back_action] = action_name
  end
  
end
