class Temperature
  def initialize(options)
    @options = options
    if options.key? :c
      @options[:f] = self.class.ctof(options[:c])
    else
      @options[:c] = self.class.ftoc(options[:f])
    end
  end

  def in_celsius
    @options.fetch(:c)
  end

  def in_fahrenheit
    @options.fetch(:f)
  end

  class << self
    def ftoc(degrees)
      (degrees - 32) * (5.0 / 9.0)
    end

    def ctof(degrees)
      degrees * (9.0 / 5.0) + 32
    end

    def from_celsius(degrees)
      Temperature.new(c: degrees)
    end

    def from_fahrenheit(degrees)
      Temperature.new(f: degrees)
    end
  end
end

class Celsius < Temperature
  def initialize(degrees)
    super(c: degrees)
  end
end

class Fahrenheit < Temperature
  def initialize(degrees)
    super(f: degrees)
  end
end
