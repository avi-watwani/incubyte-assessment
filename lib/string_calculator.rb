class StringCalculator
  def self.parse_delimiter_and_numbers(input_string)
    delimiter_pattern = /,|\n/ # Default delimiters
    numbers_part = input_string

    if input_string.start_with?("//")
      # Split into the delimiter definition line and the rest (numbers)
      parts = input_string.split("\n", 2)
      if parts.length == 2
        delimiter_definition = parts[0][2..-1] # Remove "//"
        potential_numbers_part = parts[1]

        # Scan for all bracketed delimiters: [...]
        custom_delimiters = delimiter_definition.scan(/\[(.*?)\]/).flatten

        if !custom_delimiters.empty?
          # Filter out any potentially empty delimiters like //[]...
          valid_delimiters = custom_delimiters.reject(&:empty?)
          if !valid_delimiters.empty?
            escaped_delimiters = valid_delimiters.map { |d| Regexp.escape(d) }
            delimiter_pattern = Regexp.new(escaped_delimiters.join('|'))
            numbers_part = potential_numbers_part
          end
        else
          # Check for custom delimiter definition
          match = input_string.match(/^\/\/(.)\n(.*)/m) # m for multiline matching of \n
          if match
            delimiter_pattern = match[1]
            numbers_part = match[2] # The rest of the string containing numbers
          end
        end
      end
    end
    [delimiter_pattern, numbers_part]
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
