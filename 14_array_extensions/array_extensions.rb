class Array
  def sum
    empty? ? 0 : inject(:+)
  end

  def square
    empty? ? [] : map { |item| item**2 }
  end

  def square!
    empty? ? [] : map! { |item| item**2 }
  end
end
