require 'test_helper'

class CodigosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @codigo = codigos(:one)
  end

  test "should get index" do
    get codigos_url
    assert_response :success
  end

  test "should get new" do
    get new_codigo_url
    assert_response :success
  end

  test "should create codigo" do
    assert_difference('Codigo.count') do
      post codigos_url, params: { codigo: { codigo: @codigo.codigo } }
    end

    assert_redirected_to codigo_url(Codigo.last)
  end

  test "should show codigo" do
    get codigo_url(@codigo)
    assert_response :success
  end

  test "should get edit" do
    get edit_codigo_url(@codigo)
    assert_response :success
  end

  test "should update codigo" do
    patch codigo_url(@codigo), params: { codigo: { codigo: @codigo.codigo } }
    assert_redirected_to codigo_url(@codigo)
  end

  test "should destroy codigo" do
    assert_difference('Codigo.count', -1) do
      delete codigo_url(@codigo)
    end

    assert_redirected_to codigos_url
  end
end
