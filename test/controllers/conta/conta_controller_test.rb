require 'test_helper'

class Conta::ContaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conta_conta_index_url
    assert_response :success
  end

end
