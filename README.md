# Pronto::Textlint

[![Gem Version](https://badge.fury.io/rb/pronto-textlint.svg)](http://badge.fury.io/rb/pronto-textlint)
[![Build Status](https://travis-ci.org/seikichi/pronto-textlint.svg?branch=master)](https://travis-ci.org/seikichi/pronto-textlint)
[![Coverage Status](https://coveralls.io/repos/seikichi/pronto-textlint/badge.svg?branch=master&service=github)](https://coveralls.io/github/seikichi/pronto-textlint?branch=master)

[Pronto](https://github.com/mmozuras/pronto) runner for [textlint](https://github.com/textlint/textlint).

`textlint` is needed to be installed for this runner to work.

## Configuration

Configuring textlint via `.textlintrc` will work just fine with `pronto-textlint`.

You can explicitly specify location of textlint runner by passing `PRONTO_TEXTLINT_PATH` env variable e.g:

```bash
PRONTO_TEXTLINT_PATH=/usr/very/hidden/bin/textlint PRONTO_TEXTLINT_CONFIG_PATH=/path/to/.textlintrc pronto run --index
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pronto-textlint'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pronto-textlint

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `rake test` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/seikichi/pronto-textlint.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
