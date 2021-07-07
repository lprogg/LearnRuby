class Friend
  def greeting(str = '')
    greet = 'Hello'

    if str == ''
      "#{greet}!"
    else
      "#{greet}, #{str}!"
    end
  end
end
