class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create_reps(cat, reps)
    reps.to_i.times do |i|
      cat.assessments.create(rep: i+1)
    end
  end
end
