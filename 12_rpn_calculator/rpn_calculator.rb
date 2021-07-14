class RPNCalculator
  REGEXP = %r{(-?\d) (-?\d) ([-+*/])(?!\d)}

  def initialize
    @stack = []
    @total = 0
  end

  def push(number)
    @stack << number
  end

  def value
    @total
  end

  def plus
    if @stack.length >= 2
      @total += @stack.last(2).sum
      @stack.pop(2)
      @total
    elsif @stack.length == 1
      @total += @stack[0]
      @stack.pop(1)
      @total
    elsif @stack.empty?
      raise 'calculator is empty'
    end
  end

  def minus
    if @stack.length >= 2
      @total += (@stack.last(2)[0] - @stack.last(2)[1])
      @stack.pop(2)
      @total
    elsif @stack.length == 1
      @total -= @stack[1]
      @stack.pop(1)
      @total
    elsif @stack.empty?
      raise 'calculator is empty'
    end
  end

  def divide
    if @stack.length >= 2
      @total += (@stack.last(2)[0].to_f / @stack.last(2)[1])
      @stack.pop(2)
      @total
    elsif @stack.length == 1
      @total /= @stack[0]
      @stack.pop(1)
      @total
    elsif @stack.empty?
      raise 'calculator is empty'
    end
  end

  def times
    if @stack.length >= 2
      @total += @stack.last(2).inject(:*)
      @stack.pop(2)
      @total
    elsif @stack.length == 1
      @total *= @stack[0]
      @stack.pop(1)
      @total
    elsif @stack.empty?
      raise 'calculator is empty'
    end
  end

  def tokens(string)
    string.split.map { |item| item =~ /[0-9]+/ ? item.to_i : item.to_sym }
  end

  def evaluate(string)
    return string.to_f unless string.include?(' ') && string =~ REGEXP

    result = if Regexp.last_match(3) == '/'
               Regexp.last_match(1).to_f.send(Regexp.last_match(3), Regexp.last_match(2).to_f)
             else
               Regexp.last_match(1).to_i.send(Regexp.last_match(3), Regexp.last_match(2).to_i)
             end

    string.gsub!([Regexp.last_match(1), Regexp.last_match(2), Regexp.last_match(3)].join(' '), result.to_s)

    evaluate(string)
  end
end
