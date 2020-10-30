class SchoolClassesController < ApplicationController

    before_action :find_school_class, only: [:show, :create, :edit, :update]

    def index 
    end 

    def new 
        @school_class = SchoolClass.new
    end 

    def create 
        @school_class = SchoolClass.create(school_class_params)
        redirect_to school_class_path(@school_class)
    end 

    def show 
        @school_class
    end 

    def edit 
        @school_class
    end 

    def update 
        @school_class.update(school_class_params)
        redirect_to school_class_path(@school_class)
    end 

    private 

    def find_school_class
        @school_class = SchoolClass.find_by_id(params[:id])
    end 

    def school_class_params
        params.require(:school_class).permit(:title, :room_number)
    end 

end 