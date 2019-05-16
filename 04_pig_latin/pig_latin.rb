class String
  def pigify
    self.split(/ /).map do |word|
      if /^[aeiouy]/.match(word)
        word << 'ay'
      else
        # Capture as many consonants at the start of the string and an optional 'u'.
        starting_consonants = /^[^aeiouy]*u?/.match(word).to_s
        word = word[starting_consonants.size..-1] << starting_consonants << 'ay'
      end
    end.join(' ')
  end
end

def translate(message)
  message.pigify
end