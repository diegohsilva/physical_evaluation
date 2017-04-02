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
    @training.date_start = Date.current.strftime("%d/%m/%Y")    
    @training.date_end = Date.current + 6.month    
    @training.date_end = @training.date_end.strftime("%d/%m/%Y") 
    
    
    respond_with(@training)
  end

  def edit
    @training.student_name = @training.student
    @training.coach_name = @training.coach
    
    @training.date_start = @training.date_start.strftime("%d/%m/%Y") unless @training.date_start.nil?
    @training.date_end = @training.date_end.strftime("%d/%m/%Y") unless @training.date_end.nil?
  end

  def create
    @training = Training.new(training_params)
    @training.save
    respond_with @training, location: trainings_path
  end

  def update
    @training.update(training_params)
    respond_with @training, location: trainings_path
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
      params.require(:training).permit(:coach_id, :coach_name, :student_id, :name, :date_start, :date_end, :student_name, :description, :segunda, :terca, :quarta, :quinta, :sexta, :sabado, :domingo, exercise_trainings_attributes: [:id, :exercise_id, :repetitions,:series, :effort, :descanso, :_destroy])
    end
end