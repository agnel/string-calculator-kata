# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'string_calculator')

# rubocop:disable Metrics/BlockLength
describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end
  end
end
# rubocop:enable Metrics/BlockLength
