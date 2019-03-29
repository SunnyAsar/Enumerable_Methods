module Enumerable
  def my_each()
    for i in self
      yield(i)
    end
  end

  def my_each_with_index()
    for i in (0...self.length)
      yield(self[i],i)
    end
  end

  def my_select()
    new_array =[]
    self.my_each do |item|
      new_array << item if yield(item) 
    end
    new_array
  end

  def my_all?()
    new_array = self.my_select { |i| yield(i) }
    new_array.length == self.length ? true : false
  end

  def my_any?()
    new_array = self.my_select { |i| yield(i) }
    new_array.length > 0 
  end

  def my_none?()
    new_array = self.my_select { |i| yield(i) }
    new_array == 0 
  end

  def my_count()
      new_array = []
    if block_given?
      self.my_select do |item|
        new_array << item if yield(item)
      end
      new_array.length
    else
      self.length
    end
  end

  def my_map(proc = nil)
    return self if proc.nil? && !block_given?
    my_inject([]) do |new_array, item|
      next_value = proc.nil? ? yield(item) : proc.call(item)
      new_array << next_value
    end
  end



def my_inject(carry = self[0])
  i = carry == self[0] ? 1 : 0
  while i < length
    carry = yield(carry, self[i])
    i += 1
  end
  carry
end

end
