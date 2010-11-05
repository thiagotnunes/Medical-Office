class ApplicationController < ActionController::Base
  helper :all
  
  protect_from_forgery
  
  before_filter :register_back_page_path, :only => :index
  before_filter :mailer_set_url_options
  
  private
  
  # Defines the back path link
  def register_back_page_path
    session[:back_controller] = controller_name
    session[:back_action] = action_name
  end
  
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = 'localhost:3000'
  end
  
end
