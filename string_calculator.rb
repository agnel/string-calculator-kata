# frozen_string_literal: true

# StringCalculator is a class that can add numbers together
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers.split(/,|\n/).map(&:to_i).reduce(:+)
  end
end
