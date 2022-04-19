module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < length
      new_array = []
      value = self[i]
      new_array.push(yield(value, i))
      i += 1
    end
    return new_array unless new_array.compact.empty?

    self
  end

  def my_select
    new_array = []
    my_each do |element|
      new_array.push(element) if yield(element)
    end
    new_array
  end

  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    result = 0
    return length unless block_given?

    my_each do |element|
      result += 1 if yield(element)
    end
    result
  end

  def my_map
    new_array = []
    my_each do |element|
      new_element = yield(element)
      new_array.push(new_element)
    end
    new_array
  end

  def my_inject(initial)
    acc = initial
    my_each do |element|
      acc = yield(acc, element)
    end
    acc
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < length
      new_array = []
      element = self[i]
      new_array.push(yield(element))
      i += 1
    end
    return new_array unless new_array.compact.empty?

    self
  end
end
