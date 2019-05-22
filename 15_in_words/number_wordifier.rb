class NumberWordifier
  PRE_TWENTY = [
    '', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine',
    'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
    'seventeen', 'eighteen', 'nineteen'
  ].freeze
  TENS = [
    '', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty',
    'seventy', 'eighty', 'ninety'
  ].freeze
  POWERS_OF_THOUSAND = ['', 'thousand'] + %w[
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
      PRE_TWENTY[number]
    when 20..99
      two_digits(number).rstrip
    when 100..999
      "#{three_digits(number)} #{parse(number % 100)}".rstrip
    else
      more_than_three_digits(number).rstrip
    end
  end

  def two_digits(number)
    "#{TENS[number / 10]} #{PRE_TWENTY[number % 10]}"
  end

  def three_digits(number)
    "#{PRE_TWENTY[number / 100]} hundred"
  end

  def more_than_three_digits(number)
    chunks = []
    until number.zero?
      number, remainder = number.divmod(1000)
      chunks << remainder
    end
    chunks.map { |chunk| parse chunk }.zip(POWERS_OF_THOUSAND).reverse
          .reject { |c| c.first.empty? }.join(' ')
  end
end
