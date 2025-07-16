class CalculatorController < ApplicationController
  def add
    input_string = params[:input_string]

    result = calculate_sum(input_string)
    render json: { result: result }
  end

  private

  def calculate_sum(input_string)
    return 0 if input_string.empty?

    delimiter_regex = /\/\/|[a-zA-Z,;\n\/\|\:\-\t\\\.\&%\$\*\s]/ # Not included all delimiters here. Just an example with some common delimiters.
    numbers = input_string.split(delimiter_regex).map(&:to_i)
    numbers.sum
  end
end
