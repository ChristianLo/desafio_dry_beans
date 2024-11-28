require "test_helper"

class DetailRouteControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #
  test "should get error if route is not found" do
    get "/detail_route/1"
    assert_response :not_found

    resp_url = JSON.parse(response.body)

    assert_equal resp_url["message"], "Ruta no encontrada"
  end
end
