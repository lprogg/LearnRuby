class Fixnum
  TO_WORDS = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }.freeze

  ONES = 0..9
  TENS = 10..99

  def in_words
    case self
    when ONES
      ones(self)
    when TENS
      tens(self)
    end
  end

  def ones(arg)
    'zero' if arg.zero?
    TO_WORDS[arg] if ONES.include?(arg)
  end

  def tens(arg)
    return unless TENS.include?(arg)

    TO_WORDS.include?(arg) ? TO_WORDS[arg] : "#{tens(arg / 10 * 10)} #{ones(arg % 10)}"
  end
end
