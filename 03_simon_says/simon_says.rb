def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str = 'hello', n = 2)
  (0...n).map { str }.join(' ').strip
end

def start_of_word(str = '', n = 1)
  str[0...n]
end

def first_word(str)
  str.partition(' ').first
end

def titleize(str)
  str.capitalize!
  words_no_cap = %w[and over the]

  str.split.map do |item|
    if words_no_cap.include?(item)
      item
    else
      item.capitalize
    end
  end.join(' ')
end
