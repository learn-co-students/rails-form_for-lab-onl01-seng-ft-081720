class SchoolClassesController < ApplicationController
    before_action :set_school_class, only: [:show, :edit, :update]

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.new(school_class_params)
        @school_class.save
        redirect_to school_class_path(@school_class)
    end

    def show
    end

    def edit
    end

    def update
        @school_class.update(school_class_params)
        redirect_to @school_class
    end

    private

    def set_school_class
        @school_class = SchoolClass.find_by_id(params[:id])
    end
    

    def school_class_params
        params.require(:school_class).permit(:room_number, :title)
    end

end


