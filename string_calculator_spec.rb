# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'string_calculator')

# rubocop:disable Metrics/BlockLength
describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number for a single input' do
      expect(calculator.add('7')).to eq(7)
    end

    it 'sums two-comma separated numbers' do
      expect(calculator.add('1,5')).to eq(6)
    end

    it 'sums unknown amount of comma separated numbers' do
      expect(calculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'handles newlines as delimiters' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises exception for negative numbers' do
      expect { calculator.add('1,-2,3') }.to raise_error(ArgumentError, 'negatives not allowed: -2')
    end

    it 'raises exception showing all negative numbers' do
      expect { calculator.add('1,-2,-5') }.to raise_error(ArgumentError, 'negatives not allowed: -2, -5')
    end

    it 'ignores numbers bigger than 1000' do 
      expect(calculator.add('2,1001')).to eq(2)
    end

    it 'handles delimiters of any length' do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end
  end
end
# rubocop:enable Metrics/BlockLength
