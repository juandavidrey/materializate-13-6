require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "Debe obtener el índice" do
    get welcome_index_url
    assert_response :success
  end

end
