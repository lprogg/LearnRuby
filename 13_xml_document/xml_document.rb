class XmlDocument
  def hello(tag = '')
    'hello'.then { |item| tag.empty? ? "<#{item}/>" : "<#{item} name=\'#{tag[:name]}\'/>" }
  end

  def send(tag)
    "<#{tag}/>"
  end
end
