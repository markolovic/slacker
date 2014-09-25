class CoursesController < ApplicationController
  def index
    @classes = Course.all  #.find(:all, :order => 'created_at DESC', :limit => 10)
  end

  def add
  end

  def show
    @class = Course.find(params[:id])
    
  end
end
