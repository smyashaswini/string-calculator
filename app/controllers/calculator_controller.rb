class CalculatorController < ApplicationController
  def add
    input_string = params[:input_string].to_s
    return render json: { result: 0 } if input_string.empty?
  end
end
