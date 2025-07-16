require "test_helper"

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should return 0 for empty input string" do
    get "/calculator/add", params: { input_string: "" }
    assert_response :success

    body = JSON.parse(response.body)
    assert_equal 0, body["result"]
  end
end
