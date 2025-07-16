require "test_helper"

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should return 0 for empty input string" do
    get "/calculator/add", params: { input_string: "" }
    assert_response :success

    body = JSON.parse(response.body)
    assert_equal 0, body["result"]
  end

  test 'should return the input number when a single number is provided' do
    get "/calculator/add", params: { input_string: "5" }
    assert_response :success

    body = JSON.parse(response.body)
    assert_equal 5, body["result"]
  end

  test 'should return the sum of two numbers' do
    get "/calculator/add", params: { input_string: "3,7" }
    assert_response :success

    body = JSON.parse(response.body)
    assert_equal 10, body["result"]
  end

  test 'should return the sum of multiple numbers' do
    get "/calculator/add", params: { input_string: "1,2,3,4,5" }
    assert_response :success

    body = JSON.parse(response.body)
    assert_equal 15, body["result"]
  end

  test 'should handle various delimiters of any length including newline semicolon and //' do
    get "/calculator/add", params: { input_string: "//1;2,3\n4abc8*$10****5***7" }
    assert_response :success

    body = JSON.parse(response.body)
    assert_equal 40, body["result"]
  end
end
