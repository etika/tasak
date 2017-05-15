require 'csv'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    reports_path
  end
 protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, :notice => 'You need to signin before viewing that page'
    end
  end

end
