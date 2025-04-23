class StringCalculator
  def self.add(input_string)
    return 0 if input_string.empty?

    delimiter = /,|\n/ # Default delimiters
    numbers_part = input_string

    # Check for custom delimiter definition
    if input_string.start_with?("//")
      match = input_string.match(/^\/\/(.)\n(.*)/m) # m for multiline matching of \n
      if match
        custom_delimiter = match[1]
        numbers_part = match[2] # The rest of the string containing numbers
        delimiter = custom_delimiter
      end
    end

    # Conditional split
    numbers = if delimiter.is_a?(Regexp)
                numbers_part.split(delimiter)
              else
                numbers_part.split(delimiter)
              end

    numbers.map(&:to_i).sum
  end
end
