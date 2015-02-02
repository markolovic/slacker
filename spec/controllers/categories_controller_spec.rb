require 'rails_helper'

describe CategoriesController do
  describe "#create" do
    context "when category is valid" do
      it "redirects to course path" do
        category = create(:category)
        allow(Category).to receive(:new).and_return(category)
        allow(category).to receive(:save).and_return(true)
        get :create, course_id: category.course_id, 
                     category: { name: "cat 1", weight: 0.1, reps: 1 } 
        should redirect_to(category.course)
      end
      it "saves category to database" do
        pending "stub redirect"
        get :create, course_id: 3, category: { name: "cat 1", weight: 0.1, reps: 1 }
      end
    end
    context "when category is invalid" do
      it "renders template new" do
        category = create(:category)
        allow(Category).to receive(:new).and_return(category)
        allow(category).to receive(:save).and_return(false)
        get :create, course_id: category.course.id, 
                     category: { name: "cat 1", weight: 0.1, reps: 1 } 
        should render_template(:new)
      end
    end
  end
  describe "#destroy" do
    it "deletes record from database"
    it "redirects to course path" do
      category = create(:category)
      allow(Category).to receive(:find).and_return(category.course)
      allow(category).to receive(:destroy).and_return(true)
      get :destroy, id: category.id
      should redirect_to(course_path(category.course_id))
    end
  end
end
