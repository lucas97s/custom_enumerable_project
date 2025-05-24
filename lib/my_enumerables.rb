#require "pry-byebug"

module Enumerable
  # Your code goes here
  def my_all?
    self.each do |element|
        return false if !yield(element)
    end
    return true
  end

  def my_any?
    self.each do |element|
      return true if yield(element)
    end
    return false
  end

  def my_count
    count = 0
    if block_given?
      self.each do |element|
        if yield(element) == nil || yield(element)
          count += 1
        end
      end
    else
      self.each do |element|
        count += 1
      end
    end

    return count
  end

  def my_each_with_index
    count = 0
    if block_given?
      self.each do |element, index|
        index = count
        yield(element, index)
        count += 1
      end
    end
  end

  def my_inject(argument)
    final_answer = argument
    answer = 0
    self.each do |element|
      answer = final_answer
      final_answer = yield(answer,element)
    end
    return final_answer
  end

  def my_map
    new_array = []
    self.each do |element|
      new_array << yield(element)
    end
    return new_array
  end

  def my_none?
    self.each do |element|
      if !yield(element)
        return true
      else
        return false
      end
    end
  end

  def my_select
    new_array = []
    self.each do |element|
      if yield(element)
        new_array << element
      end
    end
    return new_array
  end



end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      yield elem
    end
  end
end
