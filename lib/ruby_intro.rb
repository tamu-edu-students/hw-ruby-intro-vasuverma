# frozen_string_literal: true

# Part 1

def sum(arr)
  
  total = 0
  
  if arr.length >= 1 
    arr.each do |ele|
      total += ele
    end
  else
    total = 0
  end
  
  return total
  
end

def max_2_sum(arr)
  
  max2sum = 0
  
  if arr.length == 1
    max2sum = arr[0]
  elsif arr.length == 2
    max2sum = arr[0] + arr[1]
  elsif arr.length >2
    arr = arr.sort
    max2sum = arr[arr.length-1] + arr[arr.length-2]
  else
    max2sum = 0
  end
  
  return max2sum
end

def sum_to_n?(arr, number)
  
  if arr.length <= 1
    return false
  end
  
  if arr.length == 2
    return arr[0] + arr[1] == number ? true : false
  end
  
  arr = arr.sort
  i,k = 0, arr.length-1
  sum2n = arr[i] + arr[k]
  
  (0..arr.length-3).each do |j|
    if sum2n > number 
      k = k-1
      sum2n = arr[i] + arr[k]
    elsif sum2n < number 
      i = i+1
      sum2n = arr[i] + arr[k]
    end
  end
  
  return sum2n == number
  
end

# Part 2

def hello(name)
  
  return 'Hello, '+ name
  
end

def starts_with_consonant?(string)
  
  if string.empty?
    return false
  end
  
  return /^[^aeiou\W\d]/i.match(string)
  
end

def binary_multiple_of_4?(string)
  
  if string.empty?
    return false
  end
  
  chars = string.split('')
  chars = chars.reverse()
  decValue = 0
  notValid = false
  
  chars.each_with_index do |char, index|
    if char == '0' or char == '1'
      decValue += char.to_i*(2**index)
    else
      notValid = true
      break
    end
  end
  
  if notValid
    return false
  else
    return decValue%4 ==0
  end
  
end

# Part 3

# Object representing a book
class BookInStock
   attr_accessor :isbn, :price
   
   def initialize(isbn, price)
     if isbn.empty? or price <=0
       raise ArgumentError.new('ISBN is empty OR Price is <=0')
     end
     @isbn = isbn
     @price = price.to_f
   end
   
   def price_as_string()
     return "$%0.2f" % [@price]
   end
   
end
