describe Ebe::DivisionAlgorithm do
  it "raises an error when divisor is 0" do
    property_of {
      Rantly { integer }
    }.check { |dividend|
      expect { Ebe::DivisionAlgorithm.new(dividend, 0).result }.to raise_exception ZeroDivisionError
    }
  end

  it "has a remainder greater than or equal to 0 and less than absolute value of divisor" do
    property_of { [
      Rantly { integer },
      Rantly { nonzero_integer },
    ] }.check { |dividend, divisor|
      remainder = Ebe::DivisionAlgorithm.new(dividend, divisor).remainder
      expect(remainder).to be >= 0
      expect(remainder).to be < divisor.abs
    }
  end

  it "satisifies the division algorithm equation" do
    property_of { [
      Rantly { integer },
      Rantly { nonzero_integer },
    ] }.check { |dividend, divisor|
      quotient, remainder = Ebe::DivisionAlgorithm.new(dividend, divisor).result
      expect(dividend).to eq divisor * quotient + remainder
    }
  end
end

