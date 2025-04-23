class StringCalculator
  def self.add(numbers_string)
    return 0 if numbers_string.empty?

    numbers = numbers_string.split(',')
    numbers.map(&:to_i).sum
  end
end
