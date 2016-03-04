class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @trainings = Training.all
    respond_with(@trainings)
  end

  def show
    respond_with(@training)
  end

  def new
    @training = Training.new
    respond_with(@training)
  end

  def edit
  end

  def create
    @training = Training.new(training_params)
    @training.save
    respond_with(@training)
  end

  def update
    @training.update(training_params)
    respond_with(@training)
  end

  def destroy
    @training.destroy
    respond_with(@training)
  end

  private
    def set_training
      @training = Training.find(params[:id])
    end

    def training_params
      params.require(:training).permit(:student_id, :name, :date_start, :date_end, :student_name, :description, exercise_trainings_attributes: [:id, :exercise_id, :_destroy])
    end
end
