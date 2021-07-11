class RPNCalculator
  def initialize
    @stack = []
    @total = 0
  end

  def push(arg)
    @stack << arg
  end

  def value
    @total
  end

  def plus
    if @stack.length >= 2
      @total += @stack.last(2).sum
      @stack.pop(2)
      @total
    elsif @stack.length.equal?(1)
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
    elsif @stack.length.equal?(1)
      @total -= @stack[1]
      @stack.pop(1)
      @total
    elsif @stack.empty?
      raise 'calculator is empty'
    end
  end
end
