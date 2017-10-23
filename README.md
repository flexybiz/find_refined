# FindRefined

As simple as just find refined methods in modules.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'find_refined'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install find_refined

## Usage

Refine method in module:

```ruby
module MyModule
  refine String do
    def to_string
      'my string'
    end
  end
end
```

And later, in another module:

```ruby

require 'find_refined'

FindRefined.find(MyModule, String)  #=> [:to_string]
```

### Methods

```ruby
find             # Find refined methods in given module and class type
find_ancestors   # Find refined methods in given module and class type and all it's ancestors
find_basci       # Find refined methods in given module and all basic class types (Array, Hash, NilClass, Numeric, Range, String, Symbol)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/find_refined.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
