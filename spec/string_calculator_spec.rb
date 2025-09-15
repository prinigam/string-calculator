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

  it 'adds any number of comma-separated numbers' do
    expect(calc.add('1,2,3,4')).to eq(10)
  end

  it 'handles newlines as delimiters as well as commas' do
    expect(calc.add("1\n2,3")).to eq(6)
    expect(calc.add("4\n5\n6")).to eq(15)
  end

  it 'supports custom delimiter specified like //;\n1;2' do
    expect(calc.add("//;\n1;2")).to eq(3)
  end

  it 'raises when there are negative numbers and lists them' do
    expect { calc.add('-1') }.to raise_error(ArgumentError, 'negative numbers not allowed -1')
    expect { calc.add('2,-4,3,-5') }.to raise_error(ArgumentError, 'negative numbers not allowed -4,-5')
  end

  it "ignores numbers bigger than 1000" do
    expect(calc.add("2,1001")).to eq(2)
    expect(calc.add("1000,2")).to eq(1002)
  end

  it "supports delimiters of any length" do
    expect(calc.add("//[***]\n1***2***3")).to eq(6)
  end
end
