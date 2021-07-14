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

  POWERS_OF_TEN = {
    0 => '',
    2 => 'hundred',
    3 => 'thousand',
    6 => 'million',
    9 => 'billion',
    12 => 'trillion'
  }.freeze

  ONES = 0..9
  TENS = 10..99
  HUNDREDS = 100..999

  def in_words
    case self
    when ONES
      ones(self)
    when TENS
      tens(self)
    when HUNDREDS
      hundreds(self)
    else
      process(self)
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

  def hundreds(arg)
    return unless HUNDREDS.include?(arg)

    num_hundreds = arg / 100
    num_tens = arg - num_hundreds * 100
    num_tens = 0 if num_tens < 10
    num_ones = arg % 10

    process_hundreds(num_tens, num_ones, TO_WORDS[num_hundreds], POWERS_OF_TEN[2], ones(num_ones), tens(num_tens))
  end

  def process_hundreds(num_tens, num_ones, to_words, powers_of_ten, ones_process, tens_process)
    if num_tens.zero?
      num_ones.zero? ? "#{to_words} #{powers_of_ten}".strip : "#{to_words} #{powers_of_ten} #{ones_process}".strip
    else
      "#{to_words} #{powers_of_ten} #{tens_process}".strip
    end
  end

  def process(arg)
    num_word = []
    num_array = arg.to_s.split('').map(&:to_i)

    flag = 0
    until num_array.empty?
      slice_of_digits = num_array.pop(3).join.to_i
      process_chunk_of_three(num_word, slice_of_digits, POWERS_OF_TEN[flag * 3])
      flag += 1
    end

    num_word.join(' ').strip
  end
  
  private

  def process_chunk_of_three(num_word, slice_of_digits, powers_of_ten = '')
    case slice_of_digits
    when ONES
      num_word.unshift([ones(slice_of_digits), powers_of_ten].join(' ')) if slice_of_digits.positive?
    when TENS
      num_word.unshift([tens(slice_of_digits), powers_of_ten].join(' '))
    when HUNDREDS
      num_word.unshift([hundreds(slice_of_digits), powers_of_ten].join(' '))
    end
  end
end
