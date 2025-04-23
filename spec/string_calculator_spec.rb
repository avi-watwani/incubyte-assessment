require 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    # Handle single number input
    it "returns the number itself when given a single number" do
      expect(StringCalculator.add("1")).to eq(1)
      expect(StringCalculator.add("5")).to eq(5)
    end

    # Handle two numbers input
    it "returns the sum of two numbers separated by a comma" do
      expect(StringCalculator.add("1,2")).to eq(3)
      expect(StringCalculator.add("10,20")).to eq(30)
    end

    # Handle multiple numbers input
    it "returns the sum of multiple numbers separated by commas" do
      expect(StringCalculator.add("5,9,7")).to eq(21)
      expect(StringCalculator.add("18,67,3,22")).to eq(110)
    end

    # Handle new line as a separator
    it "returns the sum of numbers separated by newlines" do
      expect(StringCalculator.add("1\n2")).to eq(3)
      expect(StringCalculator.add("1\n2\n3")).to eq(6)
    end

    # Handle mixed separators (commas and newlines)
    it "returns the sum of numbers separated by commas and newlines" do
      expect(StringCalculator.add("6,9\n2")).to eq(17)
      expect(StringCalculator.add("14\n6,33,52\n4\n19")).to eq(128)
    end
  end
end
