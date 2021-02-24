# Covert

[![CircleCI](https://circleci.com/gh/merqloveu/covert.svg?style=svg)](https://circleci.com/gh/merqloveu/covert)
[![Gem Version](https://badge.fury.io/rb/covert.svg)](https://badge.fury.io/rb/covert)

Covert makes your string securely obfuscated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'covert'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install covert

## Usage

### Configuration
```ruby
Covert.configure do |config|
  config.cipher_key = 'blah!'
  config.cipher = 'AES-256-CBC' # default
end
```

### Obfuscation
```ruby
Covert.obfuscate('mystring') #=> "7hSfzDwp2JXZcieFpGCndA=="
```

### Unobfuscation
```ruby
Covert.unobfuscate('7hSfzDwp2JXZcieFpGCndA==') #=> "mystring"
```

## Benchmark

Comparison with gem `obfuscate` with Blowfish algo.

```ruby
require 'obfuscate'
require 'covert'
require 'benchmark'
require 'securerandom'

Obfuscate.setup :salt => 'a very weak salt indead.'

Covert.configure do |config|
  config.cipher_key = 'blah!'
end

puts Benchmark.bm { |bm|
  ids = []
  bm.report("obfuscate x1000:") {
    1000.times { ids << Obfuscate.obfuscate( SecureRandom.uuid, {:mode => :block} ) }
  }

  bm.report("clarify x1000:") {
    ids.each { |id| Obfuscate.clarify( id, {:mode => :block} ) }
  }

  ids = []
  bm.report("myobfuscate x1000:") {
    1000.times { ids << Covert.obfuscate(SecureRandom.uuid) }
  }

  bm.report("myclarify x1000:") {
    ids.each { |id| Covert.unobfuscate(id) }
  }
}
```

```shell
                            user       system     total       real
Obfuscate.obfuscate x1000:  7.883860   0.044474   7.928334 (  7.944916)
Obfuscate.clarify   x1000:  7.841752   0.016152   7.857904 (  7.873886)
Covert.obfuscate    x1000:  0.011217   0.012656   0.023873 (  0.024485)
Covert.unobfuscate  x1000:  0.003891   0.000358   0.004249 (  0.004359)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/merqloveu/covert. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/merqloveu/covert/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Covert project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/merqloveu/covert/blob/master/CODE_OF_CONDUCT.md).
