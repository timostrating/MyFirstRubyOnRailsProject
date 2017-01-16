# This methode returns if this is a prime number.
def prime?( n )
  (2..Math.sqrt(n)).none? {|f| n % f == 0}
end


# This methode checks if alle ellements of ag iven allray have the same lenth
#   when all allements are strings.
def arrayElementsSameStringLengh?( array )
  length = array[0].to_s.length
  (array).each do |i|
    if (length != i.to_s.length)
      return false;
    end
  end

  return true;  # nothing strange happend on our way, all lengths were the same
end


# This methode takes a string and replaces every x with the numbers 0 to 9.
def check(s,  length_we_are_looking_for = 8,  print_at_lenth = 4)
  prime_list  = []
  0.upto(9).each do |digit|
    number = s.gsub("x", digit.to_s).to_i
    if prime?(number) then prime_list << number end
  end

  if prime_list.length == length_we_are_looking_for
    puts " --> "+prime_list.inspect
    if arrayElementsSameStringLengh?(prime_list)
      puts " answer = "+prime_list.sort.first.to_s
      raise StandardError
    end
  elsif prime_list.length > print_at_lenth
    puts prime_list.inspect
  end
end





answer = 56003  # we start at the 7 variant
while true
  if prime?(answer) # the first number must be prime to be the answer

    str = answer.to_s

    (0...(str.length)).each do |first_index|
        s = answer.to_s
        s[first_index] = "x"
        # puts s
        check(s)
    end

    (0...(str.length-1)).each do |first_index|
      ((first_index+1)...(str.length)).each do |second_index|
        s = answer.to_s
        s[first_index] = "x"
        s[second_index] = "x"
        # puts s
        check(s)
      end
    end

    (0...(str.length-2)).each do |first_index|
      ((first_index+1)...(str.length-1)).each do |second_index|
        ((second_index+1)...(str.length)).each do |third_index|
          s = answer.to_s
          s[first_index] = "x"
          s[second_index] = "x"
          s[third_index] = "x"
          # puts s
          check(s)
        end
      end
    end

  end
  answer += 1
end
