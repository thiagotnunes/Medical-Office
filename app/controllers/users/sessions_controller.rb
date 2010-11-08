class Users::SessionsController < Devise::SessionsController
  # Override destroy in order to clean up the session
  def destroy
    session[:menu_items] = nil
    super
  end
end
