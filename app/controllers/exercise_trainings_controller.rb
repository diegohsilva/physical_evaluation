class ExerciseTrainingsController < ApplicationController
  before_action :set_exercise_training, only: [:show]
  def show
    
  end
  
  private
    def set_exercise_training
      @exercise_training = ExerciseTraining.find(params[:id])
    end
  
end
