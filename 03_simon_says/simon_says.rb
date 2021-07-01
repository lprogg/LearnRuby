def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str = "hello", n = 2)
  result = ""
  (0...n).each { result += str + " " }
  result.strip
end

def start_of_word(str = "", n = 1)
  str[0...n]
end

def first_word(str)
  str.partition(" ").first
end

def titleize(str)
  str.capitalize!
  words_no_cap = %w[and over the]

  result = str.split(" ").map { |item|
    if words_no_cap.include?(item)
      item
    else
      item.capitalize
    end
  }.join(" ")
end
