class StringCalculator
  def self.parse_delimiter_and_numbers(input_string)
    delimiter = /,|\n/ # Default delimiters
    numbers_part = input_string

    # Check for multi-character delimiters
    multi_char_match = input_string.match(/^\/\/\[(.*?)\]\n(.*)/m)
    if multi_char_match
      delimiter = multi_char_match[1] # The custom delimiter
      numbers_part = multi_char_match[2] # The rest of the string containing numbers
    else
      # Check for custom delimiter definition
      match = input_string.match(/^\/\/(.)\n(.*)/m) # m for multiline matching of \n
      if match
        delimiter = match[1]
        numbers_part = match[2] # The rest of the string containing numbers
      end
    end
    [delimiter, numbers_part]
  end

  def self.add(input_string)
    return 0 if input_string.empty?

    delimiter_pattern, numbers_part = parse_delimiter_and_numbers(input_string)
    numbers = numbers_part.split(delimiter_pattern).map(&:to_i)

    # Check for negative numbers
    negatives = numbers.select { |n| n < 0 }
    raise ArgumentError, "negatives not allowed #{negatives.join(',')}" if negatives.any?

    valid_numbers = numbers.select { |n| n <= 1000 }
    valid_numbers.sum
  end
end
