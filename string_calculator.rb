# frozen_string_literal: true

# StringCalculator is a class that can add numbers together
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter_and_numbers(numbers)
    nums = numbers.split(delimiter).map(&:to_i)

    check_for_negatives(nums)
    nums.reject { |n| n > 1000 }.reduce(:+)
  end

  private

  def extract_delimiter_and_numbers(numbers)
    return [/,|\n/, numbers] unless numbers.start_with?('//')

    parts = numbers.split("\n", 2)
    delimiter_part = parts[0][2..]
    delimiter = parse_delimiter(delimiter_part)

    [delimiter, parts[1]]
  end

  def parse_delimiter(delimiter_part)
    if delimiter_part.start_with?('[')
      delimiters = delimiter_part.scan(/\[([^\]]+)\]/).flatten
      pattern = delimiters.map { |d| Regexp.escape(d) }.join('|')
      Regexp.new(pattern)
    else
      Regexp.new(Regexp.escape(delimiter_part))
    end
  end

  def check_for_negatives(nums)
    negatives = nums.select(&:negative?)
    return if negatives.empty?

    raise ArgumentError, "negatives not allowed: #{negatives.join(', ')}"
  end
end
