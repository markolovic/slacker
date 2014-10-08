class AssessmentsController < ApplicationController
  def index
  end

  def new
    @parent_course = params[:course_id].to_i
    @ass = Assessment.new
  end

  def create
      @ass = Assessment.new(assessment_params)
      @ass.rep = Assessment.where(category: params[:assessment][:category]).count + 1
      @ass.course_id = @parent_course
      @ass.save
      redirect_to Course.find(@parent_course) # change to course_id
  end

  def show
  end

  private

    def assessment_params
      params.require(:assessment).permit(:category, :weight, :course_id)
    end

end
