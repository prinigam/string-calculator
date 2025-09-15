# String Calculator

This project implements a String Calculator in Ruby, following the requirements of the classic String Calculator kata. It includes a class for parsing and summing numbers from strings, as well as a comprehensive RSpec test suite.

## Prerequisites

- Ruby (version 2.5 or higher recommended)
- Bundler (for managing gems)

## Setup Instructions

1. **Clone the repository**:

   ```bash
   git clone https://github.com/prinigam/string-calculator
   cd string-calculator
   ```

2. **Install dependencies**:
   ```bash
   bundle install
   ```
   This will install RSpec and any other required gems listed in the `Gemfile`.

## Project Structure

- `lib/string_calculator.rb`: Main implementation of the `StringCalculator` class.
- `spec/string_calculator_spec.rb`: RSpec tests for the calculator.
- `spec/spec_helper.rb`: RSpec configuration.
- `Gemfile`: Gem dependencies.

## Usage

You can use the `StringCalculator` class in Ruby code as well:

```ruby
require_relative 'lib/string_calculator'

calc = StringCalculator.new
result = calc.add('1,2,3')
puts result # Output: 6
```

## Option 1: Run with IRB (quick test)

You can quickly test the calculator in your terminal using IRB:

```bash
irb -r ./lib/string_calculator.rb
```

Then inside IRB:

```ruby
calc = StringCalculator.new
calc.add("1,2,3")           # => 6
calc.add("//;\n1;2;3")      # => 6
calc.add("//[***]\n1***2")  # => 3
```

## Running Tests

To run the RSpec test suite and verify the calculator's functionality:

```bash
bundle exec rspec
```

This will execute all tests in the `spec/` directory and display the results.

## Features Supported

- Add numbers in a string separated by commas or newlines
- Support for custom delimiters (single or multiple, any length)
- Ignore numbers greater than 1000
- Raise an error for negative numbers, listing all negatives found

## Example Inputs

- `""` returns `0`
- `"1,2,3"` returns `6`
- `"1\n2,3"` returns `6`
- `"//;\n1;2"` returns `3`
- `"//[***]\n1***2***3"` returns `6`
- `"//[*][%]\n1*2%3"` returns `6`

## Troubleshooting

- If you encounter issues with missing gems, ensure you have run `bundle install`.
- For Ruby version issues, check your Ruby installation with `ruby -v`.
