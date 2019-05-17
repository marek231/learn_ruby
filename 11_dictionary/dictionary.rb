class Dictionary
  attr_accessor :entries, :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(entry)
    if entry.is_a? String
      @entries[entry] = nil
    elsif entry.is_a? Hash
      @entries.merge! entry
    end
    @keywords = @entries.keys.sort
  end

  def include?(key)
    @entries.include? key
  end

  def find(key)
    result = {}
    @keywords.each do |k|
      result[k] = @entries[k] if k.match(/#{key}/)
    end
    result
  end

  def printable
    to_print = []
    @keywords.each do |k|
      to_print << %([#{k}] "#{@entries[k]}")
    end
    to_print.join("\n")
  end
end
