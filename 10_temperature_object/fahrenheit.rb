require 'temperature'

class Fahrenheit < Temperature
  def initialize(arg)
    super(f: arg)
  end
end
