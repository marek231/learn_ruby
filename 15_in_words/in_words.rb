require 'number_wordifier'

class Integer
  def in_words
    NumberWordifier.new.wordify(self)
  end
end
