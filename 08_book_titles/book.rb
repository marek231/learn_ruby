ARTICLES = %w[the a an].freeze
CONJUNCTIONS = %w[and].freeze
PREPOSITIONS = %w[in of].freeze
CAPITALIZE_EXCEPTIONS = [ARTICLES, CONJUNCTIONS, PREPOSITIONS].flatten.freeze

class Book
  attr_reader :title

  def title=(title)
    @title = title.split(/ /).map.with_index do |word, i|
      if CAPITALIZE_EXCEPTIONS.include?(word) && i != 0
        word
      else
        word.capitalize
      end
    end.join(' ')
  end
end
