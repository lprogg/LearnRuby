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
    2 => 'hundred',
    3 => 'thousand',
    6 => 'million',
    9 => 'billion',
    12 => 'trillion'
  }.freeze

  ONES = 0..9
  TENS = 10..99
  HUNDREDS = 100..999
  THOUSANDS = 1_000..999_999
  MILLIONS = 1_000_000..999_999_999

  def in_words
    case self
    when ONES
      ones(self)
    when TENS
      tens(self)
    when HUNDREDS
      hundreds(self)
    when THOUSANDS
      thousands(self)
    when MILLIONS
      millions(self)
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

    if num_tens.zero? && num_ones.zero?
      "#{TO_WORDS[num_hundreds]} #{POWERS_OF_TEN[2]}".strip
    elsif num_tens.zero?
      "#{TO_WORDS[num_hundreds]} #{POWERS_OF_TEN[2]} #{ones(num_ones)}".strip
    else
      "#{TO_WORDS[num_hundreds]} #{POWERS_OF_TEN[2]} #{tens(num_tens)}".strip
    end
  end

  def thousands(arg)
    num_word = []
    num_array = arg.to_s.split('').map(&:to_i)

    flag = 0
    until num_array.empty?
      slice_of_digits = num_array.pop(3).join.to_i
      case flag
      when 0
        case slice_of_digits
        when 0
        when ONES
          num_word.unshift(ones(slice_of_digits))
        when TENS
          num_word.unshift(tens(slice_of_digits))
        when HUNDREDS
          num_word.unshift(hundreds(slice_of_digits))
        end
      when 1
        case slice_of_digits
        when ONES
          num_word.unshift("#{ones(slice_of_digits)} #{POWERS_OF_TEN[3]}")
        when TENS
          num_word.unshift("#{tens(slice_of_digits)} #{POWERS_OF_TEN[3]}")
        when HUNDREDS
          num_word.unshift("#{hundreds(slice_of_digits)} #{POWERS_OF_TEN[3]}")
        end
      end
      flag += 1
    end

    num_word.join(' ').strip
  end

  def millions(arg)
    num_word = []
    num_array = arg.to_s.split('').map(&:to_i)

    flag = 0
    until num_array.empty?
      slice_of_digits = num_array.pop(3).join.to_i
      case flag
      when 0
        case slice_of_digits
        when 0
        when ONES
          num_word.unshift(ones(slice_of_digits))
        when TENS
          num_word.unshift(tens(slice_of_digits))
        when HUNDREDS
          num_word.unshift(hundreds(slice_of_digits))
        end
      when 1
        case slice_of_digits
        when 0
        when ONES
          num_word.unshift("#{ones(slice_of_digits)} #{POWERS_OF_TEN[3]}")
        when TENS
          num_word.unshift("#{tens(slice_of_digits)} #{POWERS_OF_TEN[3]}")
        when HUNDREDS
          num_word.unshift("#{hundreds(slice_of_digits)} #{POWERS_OF_TEN[3]}")
        end
      when 2
        case slice_of_digits
        when ONES
          num_word.unshift("#{ones(slice_of_digits)} #{POWERS_OF_TEN[6]}")
        when TENS
          num_word.unshift("#{tens(slice_of_digits)} #{POWERS_OF_TEN[6]}")
        when HUNDREDS
          num_word.unshift("#{hundreds(slice_of_digits)} #{POWERS_OF_TEN[6]}")
        end
      end
      flag += 1
    end

    num_word.join(' ').strip
  end
end
