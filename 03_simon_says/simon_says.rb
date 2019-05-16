def echo(message)
  message
end

def shout(message)
  message.upcase
end

def repeat(message, times=2)
  Array.new(times, message).join(' ')
end

def start_of_word(word, position)
  word[0...position]
end

def first_word(phrase)
  phrase.split(/ /).first
end

def titleize(potential_title)
  little_words = ['and', 'over', 'the']
  words = potential_title.split(/ /)
  words.first.capitalize!
  words[1...words.size].map! do |word|
    little_words.include?(word) ? word : word.capitalize!
  end
  words.join(' ')
end