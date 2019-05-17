class String
  def pigify
    split(/ /).map do |word|
      starting_consonants = word.slice!(/^[^aeiouy]?qu|^[^aeiouy]*/i)
      word << starting_consonants << 'ay'
    end.join(' ')
  end
end

def translate(message)
  message.pigify
end
