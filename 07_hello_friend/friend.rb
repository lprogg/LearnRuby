class Friend
  def greeting(str = '')
    str.empty? ? 'Hello!' : "Hello, #{str}!"
  end
end
