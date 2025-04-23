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
    end

    it "returns the sum of two different numbers separated by a comma" do
      expect(StringCalculator.add("10,20")).to eq(30)
    end
  end
end
