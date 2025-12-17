# Navirec

Ruby client for the [Navirec](https://navirec.com) fleet management API.

## Installation

Add to your Gemfile:

```ruby
gem "navirec"
```

## Usage

### Configuration

```ruby
Navirec.configure do |config|
  config.api_token = "your_api_token"
  config.base_url = "https://api.navirec.com"  # optional, this is the default
  config.timeout = 30  # optional, in seconds
end
```

### Client

```ruby
client = Navirec.client

# Or create with a specific token
client = Navirec::Client.new(api_token: "your_token")
```

### Drivers

```ruby
# List all drivers
drivers = client.drivers.list

# Get a specific driver
driver = client.drivers.find(123)
```

### Vehicles

```ruby
# List all vehicles
vehicles = client.vehicles.list

# Get a specific vehicle
vehicle = client.vehicles.find(456)
```

### Error Handling

```ruby
begin
  client.drivers.list
rescue Navirec::AuthenticationError => e
  # Invalid or missing API token
rescue Navirec::NotFoundError => e
  # Resource not found
rescue Navirec::RateLimitError => e
  # Rate limit exceeded
rescue Navirec::ServerError => e
  # Server error (5xx)
rescue Navirec::ApiError => e
  # Other API errors
end
```

## Development

```bash
bundle install
bundle exec rspec
```

## License

MIT License
