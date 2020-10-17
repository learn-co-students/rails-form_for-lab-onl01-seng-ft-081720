class SchoolClassesController < ApplicationController
  before_action :set_schoolclass, only: [:show, :edit, :update]

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(class_params)
    if @school_class.save
      redirect_to @school_class
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @school_class
      @school_class.update(class_params)
      if @school_class.errors.any?
        render "edit"
      else
        redirect_to @school_class
      end
    else
      render "edit"
    end
  end

  private

  def set_schoolclass
    @school_class = SchoolClass.find_by_id(params[:id])
  end

  def class_params
    params.require(:school_class).permit(:title, :room_number)
  end
end
