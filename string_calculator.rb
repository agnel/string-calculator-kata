# frozen_string_literal: true

# StringCalculator is a class that can add numbers together
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/

    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..])
      numbers = parts[1]
    end

    nums = numbers.split(delimiter).map(&:to_i).filter { |n| n <= 1000 }
    negatives = nums.select(&:negative?)

    raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.reduce(:+)
  end
end
