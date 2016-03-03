class DashboardController < ApplicationController
	def index
		@evaluations =  Evaluation.by_expired(Date.current)
	end
end
