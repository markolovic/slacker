class CoursesController < ApplicationController

  def index
    @classes = Course.all  #.find(:all, :order => 'created_at DESC', :limit => 10)
  end

  def new 
    @class = Course.new
  end

  def show
    @class = Course.find(params[:id])
  end

  def create
    @class = Course.new(course_params)
    @class.save
    redirect_to @class
  end

  private

    def course_params
      params.require(:course).permit(:name, :credits)
    end

end
