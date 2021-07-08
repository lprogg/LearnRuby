class Friend
  def greeting(str = '')
    greet = 'Hello'
    str.empty? ? "#{greet}!" : "#{greet}, #{str}!"
  end
end
