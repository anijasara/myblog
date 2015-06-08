class ApplicationController < ActionController::Base
  before_filter :current_user

  protect_from_forgery with: :exception

  helper_method :null_session

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
