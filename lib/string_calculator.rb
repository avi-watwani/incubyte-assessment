class StringCalculator
  def self.add(input_string)
    return 0 if input_string.empty?

    delimiter = /,|\n/ # Default delimiters
    numbers_part = input_string

    # Check for custom delimiter definition
    match = input_string.match(/^\/\/(.)\n(.*)/m) # m for multiline matching of \n
    if match
      delimiter = match[1]
      numbers_part = match[2] # The rest of the string containing numbers
    end

    numbers = numbers_part.split(delimiter)
    numbers.map(&:to_i).sum
  end
end
