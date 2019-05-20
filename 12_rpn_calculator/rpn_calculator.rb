class RPNCalculator
  alias + plus
  alias - minus
  alias * times
  alias / divide
  attr_reader :value

  def initialize
    @stack = []
    @value = 0
  end

  def push(number)
    @stack.push number
  end

  def plus
    raise 'calculator is empty' if @stack.empty?

    a = @stack.pop
    b = @stack.pop
    @value = a + b
    push(@value)
  end

  def minus
    raise 'calculator is empty' if @stack.empty?

    a = @stack.pop
    b = @stack.pop
    @value = b - a
    push(@value)
  end

  def times
    raise 'calculator is empty' if @stack.empty?

    a = @stack.pop.to_f
    b = @stack.pop.to_f
    @value = a * b
    push(@value)
  end

  def divide
    raise 'calculator is empty' if @stack.empty?

    a = @stack.pop.to_f
    b = @stack.pop.to_f
    @value = b / a
    push(@value)
  end

  def tokens(expression)
    expression.split(/ /).map { |c| operator?(c) ? c.to_sym : c.to_i }
  end

  def evaluate(expression)
    tokens(expression).each do |token|
      if operator? token.to_s
        send(token)
      else
        @stack.push token
      end
    end
    @value
  end

  private

  def operator?(token)
    ['+', '-', '*', '/'].include? token
  end
end
