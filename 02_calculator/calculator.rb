def add(first_arg, second_arg)
  first_arg + second_arg
end

def subtract(first_arg, second_arg)
  first_arg - second_arg
end

def sum(arg)
  if arg.empty?
    0
  else
    arg.sum
  end
end

def multiply(*args)
  result = 1
  args.each { |arg| result *= arg }
  result
end

def power(first_arg, second_arg)
  first_arg ** second_arg
end

def factorial(n)
  if n == 0
    1
  else
    n * factorial(n - 1)
  end
end
