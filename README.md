# Commitment

Commitment is a work in progress.

The goal of Commitment is to consolidate common tasks that we use to uphold our
software development commitment:

* Code coverage
* Programatic style enforcement
* Vulnerability scans
* Linting

As we have worked on our code, we have adheared to monitoring the above items.
If they dip below a threshold, the build is broken.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'commitment'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install commitment

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/commitment/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request