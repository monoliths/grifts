# Grifts

Web scraper that retrieves "Diablo 3" leaderboard information. This is my first gem so expect a lot of convention errors.
Currently you can scrape seasonal leaderboards for all the hero classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grifts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grifts

## Usage

    require 'grifts'

    # create a new leaderboard, season 6 for demonhunters
    leaderboard = Leaderboard.new(6, :demonhunter)

    # scrape the season 6 demonhuner leaderboard, returns true if successful
    leaderboard.scrape(10)

    # all 1,000 positions will be in in order in the ladder variable
    leaderboard.ladder

## Development

work in progress.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/monoliths/grifts. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
