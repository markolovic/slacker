require 'rails_helper'

describe CoursesController do
  describe "#create" do
    context "when course is valid" do
      it "redirects to #show" do
        course = build(:course)
        allow(Course).to receive(:new).and_return(course)
        allow(course).to receive(:save).and_return(true)
        get :create, course: { name: "course 1", credits: 3 } 
        expect(response).to redirect_to(course) 
      end
    end

    context 'when course is invalid' do
      it "redirects to #new" do
        course = build(:course)
        allow(Course).to receive(:new).and_return(course)
        allow(course).to receive(:save).and_return(false)
        get :create, course: { name: "course 1", credits: 3 } 
        expect(response).to render_template(:new) 
      end
    end
  end

  describe "#destroy" do
    it "deletes record from database" do
      course = create(:course)
      get :destroy, id: course.id
      expect(Course.take).not_to eq course 
    end
    it "redirects to #index" do
      course = create(:course)
      allow(Course).to receive(:find).and_return(course)
      get :destroy, id: course.id
      expect(response).to redirect_to(courses_path)
    end
    
  end
end
