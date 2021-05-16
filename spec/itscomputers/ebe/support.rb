def any(except: nil, lower_bound: -10**8, upper_bound: 10**8)
  number = Random.rand(lower_bound..upper_bound)
  return number if except.nil?
  return number unless [except].flatten.include? number
  any(except: except)
end

def positive(except: nil)
  any(except: except, lower_bound: 1)
end

def negative(except: nil)
  any(except: except, upper_bound: -1)
end

