class SchoolClassesController < ApplicationController
    before_action :set_school_class, only: [:show, :edit, :update, :destroy]


    def index
        @school_classes = SchoolClass.all
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(title: params[:school_class][:title], room_number: params[:school_class][:room_number])
        
        redirect_to school_class_path(@school_class)

    end

    def show
        @school_class = SchoolClass.find_by_id(params[:id])
    end

    def edit
        if !@school_class

        redirect_to school_classes_path
        else
        render "new"
        end

    end

    def update
        if @school_class
            @school_class.update(school_class_params)
            if @school_class.errors.any?
              render "edit"
            else
              redirect_to @school_class
            end
          else
            render "edit"
          end
    end

    def destroy

    end

    private

    def set_school_class
      @school_class = SchoolClass.find_by_id(params[:id])
    end

    def school_class_params
      params.require(:school_class).permit(:title, :room_number)
    end


end
# private

#     def set_school_class
#       @school_class = SchoolClass.find_by_id(params[:id])
#     end

#     def school_class_params
#       params.require(:school_class)
#     end