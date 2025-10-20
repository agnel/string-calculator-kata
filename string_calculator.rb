# frozen_string_literal: true

# StringCalculator is a class that can add numbers together
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    a, b = numbers.split(',')
    a.to_i + b.to_i
  end
end
