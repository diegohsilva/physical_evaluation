class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @evaluations = Evaluation.all
    respond_with(@evaluations)
  end

  def show
    respond_with(@evaluation)
  end

  def new
    @evaluation = Evaluation.new
    @evaluation.student = Student.new
    @evaluation.evaluator = Evaluator.new
    #@evaluation.evaluation_date = Date.current.strftime("%d/%m/%Y")
    #@evatuation.end_date = Date.current.strftime("%d/%m/%Y")

    respond_with(@evaluation)
  end

  def edit
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.save
    respond_with @evaluation, location: evaluations_path
  end

  def update
    @evaluation.update(evaluation_params)
    respond_with(@evaluation)
  end

  def destroy
    @evaluation.destroy
    respond_with(@evaluation)
  end

  private
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params.require(:evaluation).permit(:student_id, :evaluator_id, :evaluation_date, :end_date, :student_name, :evaluator_name)
    end
end
