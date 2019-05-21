class Array
  def square
    return [] if empty?

    map { |element| element**2 }
  end

  def square!
    return [] if empty?

    map! { |element| element**2 }
  end
end
