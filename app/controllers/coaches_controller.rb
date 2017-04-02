class CoachesController < ApplicationController
  before_action :set_coach, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @coaches = Coach.all
    respond_with(@coaches)
  end
  
  autocomplete :coach, :name, :display_value => :name, :extra_data => [] do |items|
    respond_to do |format|
     format.json { render :json => @items }
    end
  end
  

  def show
    respond_with(@coach)
  end

  def new
    @coach = Coach.new
    respond_with(@coach)
  end

  def edit
  end

  def create
    @coach = Coach.new(coach_params)
    @coach.save
    respond_with @coach, :location => coaches_path
    
  end

  def update
    @coach.update(coach_params)
    respond_with @coach, :location => coaches_path
  end

  def destroy
    @coach.destroy
    respond_with(@coach)
  end

  private
    def set_coach
      @coach = Coach.find(params[:id])
    end

    def coach_params
      params.require(:coach).permit(:name, :email, :cpf, :phone, :celphone, :cref)
    end
end
