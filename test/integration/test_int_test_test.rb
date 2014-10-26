require 'test_helper'

class TestIntTestTest < ActionDispatch::IntegrationTest
  test "landing page request" do
    #https!
    get root_path
    assert_response :success
    assert :success
  end
end
