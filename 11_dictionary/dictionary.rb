class Dictionary
  def initialize
    @hash = {}
  end

  def entries
    @hash
  end

  def add(arg)
    if arg.is_a? Hash
      @hash.merge!(arg)
    else
      @hash[arg] = nil
    end
  end

  def keywords
    @hash.keys.sort
  end

  def include?(arg)
    @hash.key?(arg) ? true : false
  end

  def find(arg)
    Regexp.new(arg).then { |regexp| @hash.select { |item| item =~ regexp } }
  end

  def printable
    ''
      .then { |str| str << keywords.each_with_object(nil) { |item| str << "[#{item}] \"#{@hash[item]}\"\n" }.to_s }
      .strip
  end
end
