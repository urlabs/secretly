require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should render indx" do
    get root_url
    assert_response :success
  end
end
