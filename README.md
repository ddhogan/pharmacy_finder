# PharmacyFinder

This gem prompts the user for a zip code, and returns a list of the closest location of 3 different retail pharmacy/drugstores (in the US only).
The user can then select a location to get more information about it, such as distance, hours, and address.

To appreciate, please suspend some sensible concerns: 
	* people don't live at zipcodes, they live at addresses
	* Walgreen's is not on the list because it's store finder website is wicked hard for me to scrape.
	* In some zip codes, the closes one or two locations may belong to the same chain of drustores, and this list would not tell you about those.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pharmacy_finder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pharmacy_finder

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<ddhogan>/pharmacy_finder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PharmacyFinder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<ddhogan>/pharmacy_finder/blob/master/CODE_OF_CONDUCT.md).
