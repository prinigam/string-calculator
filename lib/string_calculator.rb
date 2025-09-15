class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ''

    numbers.split(/,|\n/).map(&:to_i).sum
  end
end
