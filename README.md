# Commitment

Commitment is [Rails::Railtie](http://api.rubyonrails.org/classes/Rails/Railtie.html) gem.
Commitment provides a series of [Rake](https://github.com/ruby/rake) tasks for [Rails](http://rubyonrails.org) applications.

The goal of Commitment is to consolidate common tasks that we use to uphold our
software development commitment:

* Code coverage
* Programatic style enforcement
* Vulnerability scans
* Linting

As we work on our code, we want to make sure we are keeping our commitment.
If we fail to do so, the build is broken.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'commitment'
end
```

And then execute:

```console
$ bundle
$ rails generate commitment:install
```

Several files will be added to your project. These are configuration files for the underlying tasks that will be run.
