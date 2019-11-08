# OMCMS

This gem is a ruby wrapper of OMCMS API's

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omcms-ruby-client'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install omcms-ruby-client
```

## Usage

Create a client using your OMCMS connector's public key and private key

```ruby
# config/initializers/omcms.rb

$omcms = OMCMS::Client.new(
  host: ENV["OMCMS_API_HOST"], # https://www.example.com
  public_key: ENV["OMCMS_PUBLIC_KEY"],
  private_key: ENV["OMCMS_PRIVATE_KEY"]
)
```

### Offering

You can fetch all or specific offering with `OMCMS::Client`

```ruby
offerings = $omcms.offerings.all
# => fetch all offerings available on OMCMS

offering = $omcms.offerings.find(1)
# => offering(id = 1) fetched from OMCMS
```

### Component

You can fetch all or specific component with specified `offering`

```ruby
offering = $omcms.offerings.find(1)

components = offering.components.all
# => all components of offering(id = 1)

component = offering.components.find(4)
# => component(id = 4) of offering(id = 1)
```

### Offering Data

You can fetch all or specific offering_data with specified `offering`

```ruby
offering = $omcms.offerings.find(1)

offering_data = offering.data.all
# => all offering_data of offering(id = 1)

offering_data = offering.data.find(1)
# => offering_data(id: 1) of offering(id = 1)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/equitymultiple/omcms-ruby-client.>
