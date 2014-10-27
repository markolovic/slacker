class CoursesController < ApplicationController

  def index
    @classes = Course.all  #.find(:all, :order => 'created_at DESC', :limit => 10)
  end

  def new 
    @class = Course.new
  end

  def per_unit_weight
  end

  def show
    @class = Course.find(params[:id])
  end

  def create
    @class = Course.new(course_params)
    @class.save
    redirect_to @class
  end

  def destroy
    Course.find(params[:id]).destroy  # necessary?
    redirect_to courses_path
    #render nothing: true
  end

  private

    def course_params
      params.require(:course).permit(:name, :credits)
    end

end
