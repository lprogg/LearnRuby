class XmlDocument
  def hello(tag = '', &block)
    name = 'hello'

    if block_given?
      "<#{name}>#{block.()}</#{name}>"
    else
      tag.empty? ? "<#{name}/>" : "<#{name} name='#{tag[:name]}'/>"
    end
  end

  def send(tag)
    "<#{tag}/>"
  end
end
