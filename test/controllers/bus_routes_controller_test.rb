require "test_helper"

class BusRoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bus_routes_index_url
    assert_response :success
  end
end
