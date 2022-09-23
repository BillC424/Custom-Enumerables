# frozen_string_literal: true

module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    i = 0
    select_array = []
    while i < length
      test = yield self[i]
      select_array.push(self[i]) if test == true
      i += 1
    end
    select_array
  end

  def my_all?
    i = 0
    all_array = []
    while i < length
      test = yield self[i]
      all_array.push(self[i]) if test == true
      i += 1
    end
    return true if all_array == self

    false
  end

  def my_any?
    i = 0
    any_array = []
    while i < length
      test = yield self[i]
      any_array.push(self[i]) if test == true
      i += 1
    end
    return true if any_array != []

    false
  end

  def my_none?
    i = 0
    none_array = []
    while i < length
      test = yield self[i]
      none_array.push(self[i]) if test == true
      i += 1
    end
    return true if none_array == []

    false
  end

  def my_count
    i = 0
    element_count = 0
    element_match_count = 0
    while i < length
      element_count += 1
      if block_given? == true
        test = yield self[i]
        element_match_count += 1 if test == true
      end
      i += 1
    end
    return element_match_count if block_given? == true

    element_count
  end

  def my_map
    i = 0
    new_array = []
    while i < length
      mapped_element = yield self[i]
      new_array.push(mapped_element)
      i += 1
    end
    new_array
  end

  def my_inject(initial_value = 0)
    i = 0
    accumulator = initial_value
    while i < length
      accumulator = yield(accumulator, self[i])
      i += 1
    end
    accumulator
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
      yield self[i]
      i += 1
    end
    self
  end
end
