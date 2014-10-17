class CategoriesController < ApplicationController

  def new
    @cat = Category.new
    @course = params[:course_id].to_i
  end

  def show
    @cat = Category.find(params[:id])
  end

  def create
    @cat = Category.new(category_params)
    @cat.course_id = params[:course_id]
    @cat.save
    params[:category][:reps].to_i.times do |i|
      @cat.assessments.create(rep: i+1)
    end
    redirect_to @cat.course
  end

  private

    def category_params
      params.require(:category).permit(:name, :weight, :reps, :attendance)
    end

end
