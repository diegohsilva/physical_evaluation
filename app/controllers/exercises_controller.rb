class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.all
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def edit
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.save
    respond_with @exercise, :location => exercises_path
  end

  def update
    @exercise.update(exercise_params)
    respond_with @exercise, :location => exercises_path
  end

  def destroy
    @exercise.destroy
    respond_with @exercise, :location => exercises_path
  end

  private
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :description)
    end
end
