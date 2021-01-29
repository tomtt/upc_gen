# UpcGen

Command line utility that prints a random UPC code

## Installation

The gem will provide the `upc_gen` command when you `gem install upc_gen` on your system.

## Usage

Run on command line like `upc_gen <optional-number-string><optional-char>`

If a number string is passed, the code before the check digit will end with those digits
If the string of numbers is followed by a '.', the random code will start with those digits
If the string of numbers is followed by a '-', a code will be found that ends with those digits, including check digit

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomtt/upc_gen. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/tomtt/upc_gen/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UpcGen project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tomtt/upc_gen/blob/master/CODE_OF_CONDUCT.md).
