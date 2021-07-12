require 'logic'

class Fixnum
  def in_words
    case self
    when Logic::ONES
      ones(self)
    when Logic::TENS
      tens(self)
    end
  end

  def ones(arg)
    if arg == 0
      'zero'
    elsif Logic::ONES.include?(arg)
      Logic::TO_WORDS[arg]
    end
  end

  def tens(arg)
    if Logic::TENS.include?(arg)
      if Logic::TO_WORDS.include?(arg)
        Logic::TO_WORDS[arg]
      else
        num_tens = arg / 10 * 10
        num_ones = arg % 10
        "#{tens(num_tens)} #{ones(num_ones)}"
      end
    end
  end
end
