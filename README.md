# Deploygate::Client
This is an unofficial ruby client library for [DeployGate](https://deploygate.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deploygate-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deploygate-client

## Usage

```ruby
client = Deploygate::Client.new(token: 'YOUR_DEPLOYGATE_TOKEN')

# GET https://deploygate.com/api/organizations
response = client.organizations
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ntsk/deploygate-client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
