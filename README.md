# GifteryClient

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/giftery_client`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'giftery_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install giftery_client

## Usage

```ruby
require 'giftery_client'

GifteryClient::Base.set_id(client_ID)
GifteryClient::Base.set_secret(client_SECRET)
GifteryClient::Base.set_crt_cert_path(.crt path)
GifteryClient::Base.set_key_path(.key path)
```

Test connection
```ruby
test = GifteryClient::ConnectTest.new
test.test_connecttion
```


Get products
```ruby
pr = GifteryClient::Products.new
pr.get_products
```

Make Order
```ruby
order = GifteryClient::Order.new
order.make_order(2111, 2000, 'madrahimov.ilhom@gmail.com', 'TEST', '', '', 'code: bant', 'test comment', '1')
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ilhom/giftery_client.

