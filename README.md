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

Before you get started, make sure all of your project changes are committed.
Commitment doesn't change too many things, but its nice to "install" something into a clean work area.

Now, add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'commitment'
end
```

And then go to your console and `cd` into the project. You'll run the following two commands:

```console
$ bundle
$ rails generate commitment:install
```

Several files will be added to your project. These are configuration files for the underlying tasks that will be run.
Other files will be updated so that Commitment can do its job.

The `$ rails generate commitment:install` will report as output all files that were changed or updated.
If you started with a clean work area, you can use your version control tools to see what changes were made.

## Roadmap

The Commitment gem presently does not make its own commitments. I'd like to fix that.

Other Items:

* Add `build-multi-commit-message` script to help with pull requests
* Add scripts to help build consistent identifiers (as per Sipity and CurateND)
