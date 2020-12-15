require 'test_helper'

class Conta::CodBarraControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conta_cod_barra_index_url
    assert_response :success
  end

end
