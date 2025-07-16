module Calculator
  # Service to perform addition operations on string inputs with various delimiters
  # Usage:
  #     ::Calculator::SumService.call(input_string)
  #
  # Examples:
  #     Calculator::SumService.call("1,2")      # => { success: true, result: 3 }
  #     Calculator::SumService.call("1\n2,3")   # => { success: true, result: 6 }
  #     Calculator::SumService.call("1,-2")     # => { success: false, error: "negatives not allowed -2" }

  class SumService
    attr_reader :input_string

    # @param input_string [String] :input_string containing numbers separated by various delimiters
    def initialize(input_string)
      @input_string = input_string.to_s
    end

    def call_delegate
      return success_result(0) if input_string.empty?

      valid_numbers = process_numbers

      success_result(valid_numbers.sum)
    rescue StandardError => e
      error_result(e.message)
    end

    private

    # Method to parse, validate, and filter numbers from input string
    # Handles parsing with various delimiters, validates no negatives, and filters out numbers > 1000
    #
    # @return [Array<Integer>] array of valid integers ready for calculation
    # @raise [StandardError] when negative numbers are present
    def process_numbers
      # Not included all delimiters here. Just an example with some common delimiters.
      delimiter_regex = /\/\/|[a-zA-Z,;\n\/\|\:\t\\\.\&%\$\*\s]/
      numbers = input_string.split(delimiter_regex).map(&:to_i)

      # Validate no negatives
      negatives = numbers.select { |num| num < 0 }
      if negatives.any?
        raise StandardError, "negatives not allowed #{negatives.join(', ')}"
      end

      # Filter out numbers greater than 1000
      numbers.select { |num| num <= 1000 }
    end

    def success_result(value)
      { success: true, result: value }
    end

    def error_result(message)
      { success: false, error: message }
    end
  end
end
