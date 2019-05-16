class String
  def pigify
    split(/ /).map do |word|
      if /^[aeiouy]/.match(word)
        word << 'ay'
      else
        # Capture as many consonants at the start of the string and an optional 'u'.
        starting_consonants = word.slice!(/^[^aeiouy]*u?/)
        word << starting_consonants << 'ay'
      end
    end.join(' ')
  end
end

def translate(message)
  message.pigify
end
