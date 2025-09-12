require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  it 'returns 0 for an empty string' do 
    expect(calc.add('')).to eq(0)
  end

  it 'returns the number when input is a single number' do
    expect(calc.add('1')).to eq(1)
    expect(calc.add('42')).to eq(42)
  end

  it 'adds two comma-separated numbers' do
    expect(calc.add('1,2')).to eq(3)
    expect(calc.add('10,5')).to eq(15)
  end
end
