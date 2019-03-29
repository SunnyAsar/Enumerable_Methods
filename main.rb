module Enumerable
  def my_each()
    for i in self
      yield(i)
    end
  end

    

end

# a = [12,23,56,43,33]

# my_each([2,2,1,5,8,7]) { |item| puts " item comiing #{item}"}

# my_each_with_index([12,23,56,43,33]) {|item, index| puts "this is index #{index} annd item #{item}"}

# my_select(a) {|item|  item > 30 }