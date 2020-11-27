require 'test_helper'

class Conta::DisplayControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conta_display_index_url
    assert_response :success
  end

end
