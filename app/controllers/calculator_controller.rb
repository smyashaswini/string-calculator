class CalculatorController < ApplicationController
  def add
    input_string = params[:input_string]

    result = calculate_sum(input_string)
    render json: { result: result }
  end

  private

  def calculate_sum(input_string)
    return 0 if input_string.empty?

    numbers = input_string.split(',').map(&:to_i)
    numbers.sum
  end
end
