require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test = tests(:one)
  end

  test "Debe obtener el índice" do
    get tests_url
    assert_response :success
  end

  test "Debe obtener nuevo" do
    get new_test_url
    assert_response :success
  end

  test "Debe crear prueba" do
    assert_difference('Test.count') do
      post tests_url, params: { test: { title: @test.title } }
    end

    assert_redirected_to test_url(Test.last)
  end

  test "Debe mostrar la prueba" do
    get test_url(@test)
    assert_response :success
  end

  test "Debe obtener editar" do
    get edit_test_url(@test)
    assert_response :success
  end

  test "should update test" do
    patch test_url(@test), params: { test: { title: @test.title } }
    assert_redirected_to test_url(@test)
  end

  test "Debería destruir la prueba" do
    assert_difference('Test.count', -1) do
      delete test_url(@test)
    end

    assert_redirected_to tests_url
  end
end
