require 'test_helper'

class AnswerOnesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer_one = answer_ones(:one)
  end

  test "should get index" do
    get answer_ones_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_one_url
    assert_response :success
  end

  test "should create answer_one" do
    assert_difference('AnswerOne.count') do
      post answer_ones_url, params: { answer_one: { correcta: @answer_one.correcta, opc1: @answer_one.opc1, opc2: @answer_one.opc2, opc3: @answer_one.opc3 } }
    end

    assert_redirected_to answer_one_url(AnswerOne.last)
  end

  test "should show answer_one" do
    get answer_one_url(@answer_one)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_one_url(@answer_one)
    assert_response :success
  end

  test "should update answer_one" do
    patch answer_one_url(@answer_one), params: { answer_one: { correcta: @answer_one.correcta, opc1: @answer_one.opc1, opc2: @answer_one.opc2, opc3: @answer_one.opc3 } }
    assert_redirected_to answer_one_url(@answer_one)
  end

  test "should destroy answer_one" do
    assert_difference('AnswerOne.count', -1) do
      delete answer_one_url(@answer_one)
    end

    assert_redirected_to answer_ones_url
  end
end
