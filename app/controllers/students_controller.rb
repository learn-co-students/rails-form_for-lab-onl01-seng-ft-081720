class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update]

    def show
    end

    def new
        @student = Student.new
    end

    def edit
    end

    def create
        @student = Student.new(student_params)
        @student.save
        redirect_to student_path(@student)
    end

    def update
        @student.update(student_params)
        redirect_to student_path(@student)
    end

    private

    def set_student
        @student = Student.find_by_id(params[:id])
    end

    def student_params
        params.require(:student).permit(:first_name, :last_name)
    end
end