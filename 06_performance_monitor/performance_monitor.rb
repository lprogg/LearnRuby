def measure(time = 1, &block)
  first_measurement = Time.now
  time.times(&block)
  second_measurement = Time.now
  (second_measurement - first_measurement) / time
end
