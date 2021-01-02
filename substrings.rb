def substrings(string, dictionary)
  string_array = string.downcase.split(" ")
  total_matches = {}
  for string in string_array do
    string_matches = dictionary.reduce(Hash.new(0)) do |result, substring|
      if (string[substring])
        result[substring] += 1
        result
      else 
        result
      end
    end
    total_matches.merge!(string_matches) {|key, v1, v2| v1 + v2}
  end
  total_matches
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)