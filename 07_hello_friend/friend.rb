class Friend
  def greeting(str = '')
    'Hello'.then { |greet| str.empty? ? "#{greet}!" : "#{greet}, #{str}!" }
  end
end
