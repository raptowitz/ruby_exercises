require 'pry'

def caesar_cipher(string, shift)
  array = string.split("").map {|letter| letter.ord}

  shift = shift % 26

  new_array = array.map do |letter|
    if(65..90).include?(letter)
      new_letter = letter + shift
      new_letter > 90 ? new_letter -= 26 : new_letter
      new_letter.chr
    elsif(97..122).include?(letter)
      new_letter = letter + shift
      new_letter > 122 ? new_letter -= 26 : new_letter
      new_letter.chr
    else
      letter.chr
    end
  end
  new_array.join
end

caesar_cipher("ttt",7)