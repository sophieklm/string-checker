class StringChecker
  def differ_by_one?(first, second)
    # returns an error if strings are different lengths
    if first.length != second.length 
      raise "Error"
    end
    # returns true only if the difference is one character
    diff(chars_in_string(first), chars_in_string(second)).length == 1
  end

  private

  def chars_in_string(string)
    # creates an array of chars to compare, ignoring case
    string.downcase.chars
  end

  def diff(first, second)
    # creates a new hash with the count of characters in first array
    # h = {"b"=>1, "a"=>1, "s"=>2}
    h = first.each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }
    # rejects anything from the second array where the count of chars
    # is more than 0 and it is possible to decrement the char from the hash
    # returning a new array of what is left
    # [s, o, b, s] becomes [o]
    second.reject { |char| h[char] > 0 && h[char] -= 1 }
  end
end
