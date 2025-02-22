# youbi

Converts Date and Time objects into Japanese weekday names in different formats (kanji, hiragana, katakana, short).

[![Gem Version](https://badge.fury.io/rb/youbi.svg)](https://rubygems.org/gems/youbi)

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'youbi'
```
And then execute:
```
$ bundle install
```
Or install it yourself as:
```
$ gem install youbi
```

## Usage

### Get the Japanese weekday name
The `japanese_day` method can be used with both `Date` and `Time` objects.

#### Example:
```ruby
require "youbi"

date = Date.new(2025, 2, 10) # 月曜日
time = Time.new(2025, 2, 10, 12, 0, 0) # 月曜日

puts date.japanese_day  # => "月曜日"
puts time.japanese_day  # => "月曜日"
```

### Available Formats

The `japanese_day(format: :○○)` option allows you to get the weekday in different formats.

| Option | Example (Monday) |
|-----------|----------------|
| `:kanji`  | `"月曜日"`       |
| `:hiragana` | `"げつようび"`   |
| `:katakana` | `"ゲツヨウビ"`   |
| `:short`  | `"月"`          |

#### Example:
```ruby
puts date.japanese_day(format: :hiragana)  # => "げつようび"
puts date.japanese_day(format: :katakana)  # => "ゲツヨウビ"
puts date.japanese_day(format: :short)     # => "月"
```

### Error Handling
If you pass an invalid format to `japanese_day`, the gem will raise a `Youbi::Error`.

#### Example:
```ruby
begin
  date.japanese_day(format: :invalid_format)
rescue Youbi::Error => e
  puts e.message  # => "Invalid format: invalid_format"
end
```

### Running Tests
You can run tests using RSpec:
```
bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ryotaro-shirai/youbi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ryotaro-shirai/youbi/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Youbi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ryotaro-shirai/youbi/blob/main/CODE_OF_CONDUCT.md).
