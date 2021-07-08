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
  str.capitalize!.split.map { |item| %w[and over the].include?(item) ? item : item.capitalize }.join(' ')
end
