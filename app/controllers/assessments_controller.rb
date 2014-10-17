class AssessmentsController < ApplicationController
  def index
  end

  def new
    @ass = Assessment.new
  end

  def create
    @ass = Assessments.new(assessment_params)
    @ass.rep = Assessments.where(category: params[:category]).count + 1
    @ass.save
    redirect_to @ass
  end

  def show
  end

  private

    def assessment_params
      params.require(:assessment).permit(:category, :weight, :course_id)
    end

end
