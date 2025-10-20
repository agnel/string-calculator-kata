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
  end
end
# rubocop:enable Metrics/BlockLength
