class CalculatorController < ApplicationController
  def add
    input_string = params[:input_string]
    service_result = Calculator::SumService.new(input_string).call_delegate

    if service_result[:success]
      render json: { result: service_result[:result] }
    else
      render json: { error: service_result[:error] }, status: :bad_request
    end
  end
end
