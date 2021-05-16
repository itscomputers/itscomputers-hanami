module Ebe
  module_function

  <<~DESC
    [Integer, Integer] ~> Boolean
    returns true if and only if `a` is divisible by `b`
  DESC
  def divides?(b, a)
    b != 0 && a % b == 0
  end

  #---------------------------

  <<~DESC
    [Integer, Integer] ~> [Integer, Integer]
    returns [quotient, remainder] such that
      - `a == b * quotient + remainder`
      - `0 <= remainder`
      - `remainder < b.abs`
  DESC
  def div_rem(a, b)
    DivisionAlgorithm.new(a, b).result
  end

  #---------------------------

  <<~DESC
    [Integer, Integer] ~> Integer
    returns `quotient` part of `div_rem`
  DESC
  def quotient(a, b)
    DivisionAlgorithm.new(a, b).quotient
  end

  #---------------------------

  <<~DESC
    [Integer, Integer] ~> Integer
    returns `remainder` part of `div_rem`
  DESC
  def remainder(a, b)
    DivisionAlgorithm.new(a, b).remainder
  end
end

