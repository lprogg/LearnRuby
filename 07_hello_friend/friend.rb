class Friend
  def greeting(str = '')
    greet = 'Hello'
    str == '' ? "#{greet}!" : "#{greet}, #{str}!"
  end
end
