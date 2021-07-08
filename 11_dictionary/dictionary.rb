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
    @hash.keys
  end

  def include?(arg)
    @hash.key?(arg) ? true : false
  end

  def find(arg)
    temp = {}
    if @hash == {} || arg == 'nothing'
      {}
    elsif @hash.key?(arg)
      @hash
    end
  end
end
