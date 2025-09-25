class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers.strip == ''

    nums = numbers.dup
    delimiter_regex = /,|\n/
    operator = :add

    if nums.start_with?('//')
      header, nums = nums.split("\n", 2)

      if header.start_with?("//op:")
        _, op = header.split(":",2)
        operator = op.to_sym
      elsif header.include?("[")
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

    parts.reject! { |n| n > 1000 }

    case operator
    when :add
      parts.sum
    when :multiply
      parts.inject(1) {|prod, n| prod * n }
    else
      raise ArgumentError.new("Unknown operator")
    end
  end
end
