class XmlDocument
  def hello(tag = '')
    name = 'hello'
    
    if block_given?
      "<#{name}>#{yield}</#{name}>"
    else
      tag.empty? ? "<#{name}/>" : "<#{name} name='#{tag[:name]}'/>"
    end
  end

  def send(tag)
    "<#{tag}/>"
  end
end
