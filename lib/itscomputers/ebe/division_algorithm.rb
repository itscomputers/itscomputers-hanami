module Ebe
  class DivisionAlgorithm
    def initialize(dividend, divisor)
      @dividend = dividend
      @divisor = divisor
    end

    def result
      [quotient, remainder]
    end

    def remainder
      @remainder ||= begin
        rem = @dividend % @divisor
        rem < 0 ? rem + @divisor.abs : rem
      end
    end

    def quotient
      @quotient ||= (@dividend - remainder) / @divisor
    end
  end
end

