class Array
  def sum
    s = 0
    empty? ? s = 0 : each { |item| s += item }
    s
  end

  def square
    empty? ? [] : map { |item| item**2 }
  end

  def square!
    empty? ? [] : map! { |item| item**2 }
  end
end
