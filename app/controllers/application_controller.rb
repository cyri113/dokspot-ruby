class ApplicationController < ActionController::Base
  include Pundit  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate_user!
  #after_action :verify_authorized
end