require 'temperature'

class Celsius < Temperature
  def initialize(arg)
    super(c: arg)
  end
end
