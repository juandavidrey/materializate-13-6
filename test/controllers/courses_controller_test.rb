require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "Debe obtener el índice" do
    get courses_url
    assert_response :success
  end

  test "Debe obtener nuevo" do
    get new_course_url
    assert_response :success
  end

  test "Debe crear curso" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { cupo: @course.cupo, descripcion: @course.descripcion, nombre: @course.nombre } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "Debe mostrar curso" do
    get course_url(@course)
    assert_response :success
  end

  test "Debe obtener editar" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "Debe actualizar el curso" do
    patch course_url(@course), params: { course: { cupo: @course.cupo, descripcion: @course.descripcion, nombre: @course.nombre } }
    assert_redirected_to course_url(@course)
  end

    assert_difference('Course.count', -1) do
  test "Debería destruir el rumbo" do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
