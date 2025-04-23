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

    # Handle custom delimiters
    context "with custom delimiters" do
      it "supports a custom delimiter specified on the first line" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
        expect(StringCalculator.add("//|\n5|9|7")).to eq(21)
        expect(StringCalculator.add("//*\n18*67*3*22")).to eq(110)
      end
    end

    # Handle negative numbers
    context "with negative numbers" do
      it "throws an exception for a negative numbers" do
        expect { StringCalculator.add("-1") }.to raise_error(ArgumentError, "negatives not allowed -1")
        expect { StringCalculator.add("//;\n-1;2") }.to raise_error(ArgumentError, "negatives not allowed -1")
        expect { StringCalculator.add("//|\n5|-9|-7") }.to raise_error(ArgumentError, "negatives not allowed -9,-7")
      end
    end

    # Handle empty entries
    it "handles empty entries caused by adjacent delimiters" do
      expect(StringCalculator.add("//;\n7;;5")).to eq(12)
    end
  end
end
