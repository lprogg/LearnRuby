class Temperature
  def initialize(temp_hash = {})
    @temp_hash = temp_hash
  end

  def self.from_fahrenheit(arg)
    Temperature.new({ f: arg })
  end

  def self.from_celsius(arg)
    Temperature.new({ c: arg })
  end

  def self.ftoc(arg)
    (5.0 / 9.0) * (arg.to_f - 32.0)
  end

  def self.ctof(arg)
    ((9.0 / 5.0) * arg.to_f) + 32.0
  end

  def in_celsius
    if @temp_hash.key?(:c)
      @temp_hash[:c]
    else
      Temperature.ftoc(@temp_hash[:f])
    end
  end

  def in_fahrenheit
    if @temp_hash.key?(:f)
      @temp_hash[:f]
    else
      Temperature.ctof(@temp_hash[:c])
    end
  end
end

require 'celsius'
require 'fahrenheit'
