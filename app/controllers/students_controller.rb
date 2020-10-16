class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update]

    def new
        @student = Student.new
    end

    def create
        # binding.pry
        @student = Student.new(student_params)
        @student.save
        redirect_to student_path(@student)
    end

    def show 
    end

    def edit
    end

    def update
        @student.update(student_params)
        redirect_to @student
    end

    private 

    def set_student
        @student = Student.find_by_id(params[:id])
    end
  

    def student_params#(*args)
        # params.require(:student).permit(*args)
        params.require(:student).permit(:first_name, :last_name)
    end

end