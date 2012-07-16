# Baloo

The simple 'bear' necessities for working with graph.facebook.com

## Installation

Add this line to your application's Gemfile:

    gem 'baloo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baloo

## Usage

```ruby
  # configure
  # only required if you're going to do stuff with your app access token later
  Baloo.configure :app_id => '...', :app_secret => '...', app_namespace => '...'

  #get /me
  Baloo.get 'me', :query => {:access_token => '...'}
  # => {...} # a facebook user hash

  # post 
  Baloo.post 'me/albums', :body => {:access_token => '...', :name => 'Baloo Album'}
  # => {"id": "..."}

  # app access token / client credentials
  # Baloo#app_token is an alias for Baloo#client_credentials
  Baloo.app_token
  # => "your_app_token"

  Baloo.client_credentials
  # => "same_thing"

  Baloo.app_token(app_id, app_secret)
  # => "app token for some other app"

  # Batch Requests
  batch = Baloo::BatchRequest.new
  25.times { batch.add :get, 'betapond' }
  batch.perform {|res| puts res['body']['id'] }
  # => 158724218692 (25 times)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
