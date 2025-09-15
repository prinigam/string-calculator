class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.strip == ''

    nums = numbers.dup
    delimiter_regex = /,|\n/

    if nums.start_with?('//')
      header, nums = nums.split("\n", 2)

      if header.include?("[")
        delimiters = header.scan(/\[(.*?)\]/).flatten
        delimiter_regex = Regexp.union(delimiters.map { |d| Regexp.new(Regexp.escape(d)) })
      else
        custom = header[2..-1]
        delimiter_regex = Regexp.new(Regexp.escape(custom))
      end
    end

    parts = nums.split(delimiter_regex).map(&:to_i)

    negatives = parts.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError.new("negative numbers not allowed #{negatives.join(',')}")
    end

    parts.reject { |n| n > 1000 }.sum
  end
end
