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
    new_array = []
    self.my_select do |item|
      new_array << item if yield(item)  
    end
    new_array.length == self.length ? true : false
  end

  def my_any?()
    new_array = []
    self.my_select do |item|
      new_array << item if yield(item)
    end
    new_array.length > 0 ? true : false
  end

  
  

end

# a = [12,23,56,43,33]

# my_each([2,2,1,5,8,7]) { |item| puts " item comiing #{item}"}

# my_each_with_index([12,23,56,43,33]) {|item, index| puts "this is index #{index} annd item #{item}"}

# my_select(a) {|item|  item > 30 }