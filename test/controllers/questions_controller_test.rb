require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "Debe obtener el índice" do
    get questions_url
    assert_response :success
  end

  test "Debe obtener nuevo" do
    get new_question_url
    assert_response :success
  end

  test "Debería crear una pregunta" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { title: @question.title } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "Debe mostrar la pregunta" do
    get question_url(@question)
    assert_response :success
  end

  test "Debe obtener editar" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "Debe actualizar la pregunta" do
    patch question_url(@question), params: { question: { title: @question.title } }
    assert_redirected_to question_url(@question)
  end

  test "Debería destruir la pregunta" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end
end
