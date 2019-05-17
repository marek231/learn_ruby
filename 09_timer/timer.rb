class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def padded(number)
    (number / 10).zero? ? "0#{number}" : number.to_s
  end

  def time_string
    seconds = padded(@seconds % 3600 % 60)
    minutes = padded(@seconds % 3600 / 60)
    hours = padded(@seconds / 3600)
    "#{hours}:#{minutes}:#{seconds}"
  end
end
