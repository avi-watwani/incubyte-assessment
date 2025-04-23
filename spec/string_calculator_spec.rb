require 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    # Handle single number input
    it "returns the number itself when given a single number" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns another single number correctly" do
      expect(StringCalculator.add("5")).to eq(5)
    end
  end
end
