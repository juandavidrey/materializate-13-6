require 'test_helper'

class AnswerOnesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer_one = answer_ones(:one)
  end

  test "Debe obtener el índice" do
    get answer_ones_url
    assert_response :success
  end

  test "Debe obtener nuevo" do
    get new_answer_one_url
    assert_response :success
  end

  test "Debe crear una pregunta con respuesta única" do
    assert_difference('AnswerOne.count') do
      post answer_ones_url, params: { answer_one: { correcta: @answer_one.correcta, opc1: @answer_one.opc1, opc2: @answer_one.opc2, opc3: @answer_one.opc3 } }
    end

    assert_redirected_to answer_one_url(AnswerOne.last)
  end

  test "Debería mostrar pregunta con respuesta única" do
    get answer_one_url(@answer_one)
    assert_response :success
  end

  test "Debe obtener editar" do
    get edit_answer_one_url(@answer_one)
    assert_response :success
  end

  test "Debe actualizar pregunta con respuesta única" do
    patch answer_one_url(@answer_one), params: { answer_one: { correcta: @answer_one.correcta, opc1: @answer_one.opc1, opc2: @answer_one.opc2, opc3: @answer_one.opc3 } }
    assert_redirected_to answer_one_url(@answer_one)
  end

  test "Debería destruir pregunta con respuesta única" do
    assert_difference('AnswerOne.count', -1) do
      delete answer_one_url(@answer_one)
    end

    assert_redirected_to answer_ones_url
  end
end
