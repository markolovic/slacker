class CoursesController < ApplicationController
  def index
  end

  def add
  end

  def show
    @class = Course.find(params[:id])
    
  end
end
