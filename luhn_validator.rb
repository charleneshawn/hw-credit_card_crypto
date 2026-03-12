# frozen_string_literal: true

# Luhn Validator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i).reverse
    sum = nums_a.each_with_index.sum do |digit, i|
      if i.odd?
        digit *= 2
        digit -= 9 if digit > 9
      end
      digit
    end
    (sum % 10).zero?
  end
end
