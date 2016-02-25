class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  
  def index
    @students = Student.all
    respond_with(@students)
  end

  def show
    respond_with(@student)
  end

  def new
    @student = Student.new
    respond_with(@student)
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_with @student, :location => students_path
  end

  def update
    @student.update(student_params)
    respond_with @student, :location => students_path
  end

  def destroy
    @student.destroy
    respond_with(@student)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :street, :number_address, :neighborhood, :city, :state, :zipcode, :email, :birth_date, :phone, :cell_phone)
    end
end
