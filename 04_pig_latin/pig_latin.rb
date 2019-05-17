class String
  def capitalized?
    self[/^[A-Z]?/] != ''
  end

  def pigify
    split(/ /).map do |word|
      starting_consonants = word.slice!(/^[^aeiouy]?qu|^[^aeiouy]*/i)
      word.capitalize! if starting_consonants.capitalized?
      word << starting_consonants.downcase << 'ay'
    end.join(' ')
  end
end

def translate(message)
  message.pigify
end
