class StudentsController < ApplicationController
  before_action :set_student, only: [:create, :update, :edit, :show]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @student
      @student.update(student_params)
      if @student.errors.any?
        render "edit"
      else
        redirect_to @student
      end
    else
      render "edit"
    end
  end

  private

  def set_student
    @student = Student.find_by_id(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
