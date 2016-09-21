require 'test_helper'

class PledgesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pledges_new_url
    assert_response :success
  end

end
