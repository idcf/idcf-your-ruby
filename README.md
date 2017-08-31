# Idcf::Your
[![Code Climate](https://codeclimate.com/github/idcf/idcf-your-ruby/badges/gpa.svg)](https://codeclimate.com/github/idcf/idcf-your-ruby)
[![Issue Count](https://codeclimate.com/github/idcf/idcf-your-ruby/badges/issue_count.svg)](https://codeclimate.com/github/idcf/idcf-your-ruby)
[![Test Coverage](https://codeclimate.com/github/idcf/idcf-your-ruby/badges/coverage.svg)](https://codeclimate.com/github/idcf/idcf-your-ruby/coverage)
[![Build Status](https://travis-ci.org/idcf/idcf-your-ruby.svg?branch=master)](https://travis-ci.org/idcf/idcf-your-ruby)

A Ruby client for [IDCF Cloud Your API](http://docs.idcf.jp/cloud/billing/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'idcf-your'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idcf-your

## Dependencies

* Ruby 2.1.10 or higher

## Usage
### Basic usage
#### Client
```ruby
require 'idcf/your'

client =
  Idcf::Your::Client.new(
    api_key: ENV['IDCF_API_KEY'],
    secret_key: ENV['IDCF_SECRET_KEY']
  )

# Call GET request directly
# returns Response object
response = client.get('billings/history')
response.success? #=> true
response.status   #=> 200

# Response#body returns HTTP response body as a hash or an array
response.body             #=> [meta, data[...]]
response.body["data"][0]  #=> ["month": "2017-07", "billing_amount": 58709, "payment_status": 3]

# Response#[] is alias to Response#body[]
response["data"][0]       #=> ["month": "2017-07", "billing_amount": 58709, "payment_status": 3]
```

### Payment history
```ruby
client.get('billings/history')
client.list_billing_history
```

### Bills
```ruby
client.get('billings/2017-07')
client.list_billing_detail('2017-07')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/idcf/idcf-your-ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
