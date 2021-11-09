class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection


  protect_from_forgery with: :exception

  before_action :set_csrf_cookie

  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end


  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end

end
