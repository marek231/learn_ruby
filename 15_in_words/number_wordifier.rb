class NumberWordifier
  UNDER_TWENTY = [
    '', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine',
    'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
    'seventeen', 'eighteen', 'nineteen'
  ].freeze
  MULTIPLE_OF_TEN = [
    '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty',
    'seventy', 'eighty', 'ninety'
  ].freeze
  POWER_OF_ONE_THOUSAND = ['', 'thousand'] + %w[
    m b tr quadr quint sext sept oct non dec
  ].map { |prefix| "#{prefix}illion" }.freeze

  def wordify(number)
    return 'zero' if number.zero?

    parse(number)
  end

  private

  def parse(number)
    case number
    when 0..19
      UNDER_TWENTY[number]
    when 20..99
      parse_two_digits(number).rstrip
    when 100..999
      "#{parse_three_digits(number)} #{parse(number % 100)}".rstrip
    else
      parse_more_than_three_digits(number).rstrip
    end
  end

  def parse_two_digits(number)
    "#{MULTIPLE_OF_TEN[number / 10]} #{UNDER_TWENTY[number % 10]}"
  end

  def parse_three_digits(number)
    "#{UNDER_TWENTY[number / 100]} hundred"
  end

  def parse_more_than_three_digits(number)
    number.digits.each_slice(3).map { |g| g.join.reverse.to_i }
          .map { |g| parse g }.zip(POWER_OF_ONE_THOUSAND).reverse
          .reject { |g| g.first.empty? }.join(' ')
  end
end
