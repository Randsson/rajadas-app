require 'test_helper'

class FilePanel::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get file_panel_welcome_index_url
    assert_response :success
  end

end
