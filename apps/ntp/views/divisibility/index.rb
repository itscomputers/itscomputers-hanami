module Ntp::Views::Divisibility
  class Index
    include Ntp::View

    def example
      return if divisor.nil? || dividend.nil?
      @example ||= Example.new divisor, dividend
    end

    class Example
      attr_reader :divisor, :dividend

      def initialize(divisor, dividend)
        @divisor = divisor
        @dividend = dividend
      end

      def divides?
        Ebe.divides? divisor, dividend
      end

      def result
        "#{divisor} #{divides_symbol} #{dividend}"
      end

      def divides_symbol
        divides? ? "|" : "\u2224"
      end

      def forward_connectors
        divides? ?
          ["divides", "is a divisor of"] :
          ["does not divide", "is not a divisor of"]
      end

      def backward_connectors
        divides? ?
          ["is divisible by", "is a multiple of"] :
          ["is not divisible by", "is not a multiple of"]
      end

      def quotient
        Ebe.quotient(dividend, divisor)
      end

      def multipliers
        @multipliers ||= [quotient, quotient + (divisor < 0 ? -1 : 1)].sort_by { |multiplier| multiplier * divisor }
      end

      def lower_multiplier
        multipliers.first
      end

      def upper_multiplier
        multipliers.last
      end
    end
  end
end

