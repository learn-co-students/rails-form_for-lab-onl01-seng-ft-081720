
class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])

        redirect_to student_path(@student)
    end

    def show
        @student = Student.find_by_id(params[:id])
    end

    def edit
        if !@student
            redirect_to students_path
        else
            render "new"
        end
        
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

    def destroy

    end



    def set_student
        @student = Student.find_by_id(params[:id])
      end
  
      def student_params
        params.require(:student).permit(:first_name, :last_name)
      end



end
