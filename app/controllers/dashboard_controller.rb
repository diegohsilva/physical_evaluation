class DashboardController < ApplicationController
	def index
	  @trainings = []
		@evaluations = []
		if current_user.student?
	    @trainings = Training.by_week_day(Date.current.wday)
		else
		  @evaluations =  Evaluation.by_expired(Date.current + 7.day)  		
		end  
	end
end
