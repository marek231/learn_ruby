def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(array_of_numbers)
  array_of_numbers.inject(:+) || 0
end

def multiply(a, b, *args)
  a * b * (args.inject(:*) || 1)
end

def power(a, b)
  a ** b
end

def factorial(number)
  (1..number).inject(:*) || 1
end