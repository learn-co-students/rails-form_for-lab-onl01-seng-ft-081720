class SchoolClassesController < ApplicationController
    before_action :set_school_class, only: [:show, :edit, :update]

    def new
        @school_class = SchoolClass.new
    end
    
    def create
        @school_class = SchoolClass.new(class_params(:title, :room_number))
        if @school_class.save
            redirect_to(@school_class)
        else
            render "new"
        end
    end

    def show
    end

    def edit
    end

    def update
        if @school_class.update(class_params(:title, :room_number))
            render "show"
        else
            render "edit"
        end
    end


    private

    def class_params(*args)
        params.require(:school_class).permit(*args)
    end

    def set_school_class
        @school_class = SchoolClass.find(params[:id])
    end
end