def reverser
  strings = yield.split(/ /)
  strings.map(&:reverse).join(' ')
end

def adder(value_to_add=1)
  yield + value_to_add
end

def repeater(amount = 1)
  amount.times { yield }
end