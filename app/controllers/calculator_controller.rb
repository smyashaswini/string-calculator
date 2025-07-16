class CalculatorController < ApplicationController
  def add
    input_string = params[:input_string]

    result = calculate_sum(input_string)
    render json: { result: result }
  end

  private

  def calculate_sum(input_string)
    return 0 if input_string.empty?

    input_1 = input_string.split(",")[0].to_i
    input_2 = input_string.split(",")[1].to_i
    input_1 + input_2
  end
end
