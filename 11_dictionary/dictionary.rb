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
    @hash.key?(arg)
  end

  def find(arg)
    /#{arg}/.then { |regexp| @hash.select { |item| item =~ regexp } }
  end

  def printable
    ''
      .then { keywords.map { |item| "[#{item}] \"#{@hash[item]}\"\n" }.join }
      .strip
  end
end
