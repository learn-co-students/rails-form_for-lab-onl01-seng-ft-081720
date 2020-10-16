class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update]

    def new
        @student = Student.new
    end
    
    def create
        @student = Student.new(student_params(:first_name, :last_name))

        if @student.save
            redirect_to(@student)
        else
            render "new"
        end
    end

    def show
    end

    def edit
    end

    def update
        if @student.update(student_params(:first_name, :last_name))
            render "show"
        else
            render "edit"
        end
    end

    private

    def student_params(*args)
        params.require(:student).permit(*args)
    end

    def set_student
        @student = Student.find(params[:id])
    end
end