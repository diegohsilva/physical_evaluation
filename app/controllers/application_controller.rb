require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  responders :flash
 
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	private
	
	def message
		@message ||= {}
	end

  helper_method :message

  def define_environment_message
    message[:alert] ||= []
  end


end
