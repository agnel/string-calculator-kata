# frozen_string_literal: true

# StringCalculator is a class that can add numbers together
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/

    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)
      delimiter_part = parts[0][2..]

      delimiter = if delimiter_part.start_with?('[') && delimiter_part.end_with?(']')
                    Regexp.new(Regexp.escape(delimiter_part[1..-2]))
                  else
                    Regexp.new(Regexp.escape(delimiter_part))
                  end

      numbers = parts[1]
    end

    nums = numbers.split(delimiter).map(&:to_i)
    negatives = nums.select(&:negative?)

    raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    nums.reject { |n| n > 1000 }.reduce(:+)
  end
end
