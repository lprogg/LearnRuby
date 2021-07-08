def add(first_arg, second_arg)
  first_arg + second_arg
end

def subtract(first_arg, second_arg)
  first_arg - second_arg
end

def sum(arg)
  arg.empty? ? 0 : arg.sum
end

def multiply(*args)
  args.inject(:*)
end

def power(first_arg, second_arg)
  first_arg**second_arg
end

def factorial(n)
  n.zero? ? 1 : n * factorial(n - 1)
end
