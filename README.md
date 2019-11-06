# OMCMS

This gem is a ruby wrapper of OMCMS API's

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omcms-ruby-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omcms-ruby-client

## Usage

Create a client using your OMCMS connector's public key and private key

```ruby
# config/initializers/omcms.rb

$omcms = OMCMS::Client.new(
  host: ENV["OMCMS_API_HOST"], # http://localhost:8877
  public_key: ENV["OMCMS_PUBLIC_KEY"],
  private_key: ENV["OMCMS_PRIVATE_KEY"]
)
```

### Offering

You can fetch all or specific offering with `OMCMS::Client`

```ruby
offerings = $omcms.offerings.all
# => fetch all offerings available on OMCMS

offering = $omcms.offerings.get(123)
# => offering(id = 123) fetched from OMCMS
```

### Component

You can fetch all or specific component with specified `offering`

```ruby
offering = $omcms.offerings.get(123)

components = offering.components.all
# => all components of offering(id = 123)

component = offering.components.get(456)
# => component(id = 456) of offering(id = 123)
```

### Offering Data

You can fetch all or specific offering_data with specified `offering`

```ruby
offering = $omcms.offerings.get(123)

offering_data = offering.data.all
# => all offering_data of offering(id = 123)

offering_data = offering.data.get(456)
# => offering_data(id: 456) of offering(id = 123)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/equitymultiple/omcms-ruby-client.
