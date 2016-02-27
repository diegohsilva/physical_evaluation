class EvaluatorsController < ApplicationController
  before_action :set_evaluator, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @evaluators = Evaluator.all
    respond_with(@evaluators)
  end

  def show
    respond_with(@evaluator)
  end

  def new
    @evaluator = Evaluator.new
    respond_with(@evaluator)
  end

  def edit
  end

  def create
    @evaluator = Evaluator.new(evaluator_params)
    @evaluator.save
    respond_with @evaluator, :location => evaluators_path
  end

  def update
    @evaluator.update(evaluator_params)
    respond_with @evaluator, :location => evaluators_path
  end

  def destroy
    @evaluator.destroy
    respond_with @evaluator, :location => evaluators_path
  end

  private
    def set_evaluator
      @evaluator = Evaluator.find(params[:id])
    end

    def evaluator_params
      params.require(:evaluator).permit(:name, :email, :cpf, :phone)
    end
end
