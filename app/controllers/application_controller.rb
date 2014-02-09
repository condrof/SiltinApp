class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #load_and_authorize_resource
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  def current_user
    @current_user = case
                       when current_admin
                         current_admin
                       when current_supplier
                         current_supplier
                       else
                         nil
                       end
  end

  def current_ability
     @current_ability ||= Ability.new(current_user)
  end

end
