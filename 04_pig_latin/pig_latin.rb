def logic(str)
  vowels = %w[a e i o u]

  until vowels.include?(str[0])
    str = if str[0..1] == 'qu' || str[0..1] == 'Qu'
            str[2..] << 'qu'
          else
            str[1..] << str[0]
          end
  end

  str << 'ay'
end

def translate(str)
  str.split.map { |item| logic(item) }.join(' ')
end

def capitalize(str)
  str.split.map { |item|
    item == item.capitalize ? translate(item).capitalize : translate(item)
  }.join(' ')
end

def punctuation(str)
  capitalize(str).split.map do |item|
    punct = /[[:punct:]]/.match(item)
    if punct
      item.tr!(punct.to_s, '')
      item << punct.to_s
    else
      item
    end
  end.join(' ')
end
