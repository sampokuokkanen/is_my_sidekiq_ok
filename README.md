# IsMySidekiqOk

IsMySidekiqOk answers the question: is your Sidekiq ok? 
Define limits, and then if Sidekiq is running within those limits, you get a :success 200 response, otherwise you get a 500 error response.
Can be used with Rails > 5.2. 
*You can customize the response code. 
## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'is_my_sidekiq_ok'
```

Mount the engine to get the route (`routes.rb`):

```ruby
mount IsMySidekiqOk::Engine => '/is_my_sidekiq_ok'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install is_my_sidekiq_ok
```

And now just hit that endpoint! 

Though you'll probably also want to configure the gem. 
This gem has the following settings: 

```ruby
# success
setting :status_symbol, :ok
# failior
setting :error_symbol, :internal_server_error
# Sidekiq instances running, fail if below this
setting :processes_size, 4
# below values will cause check to fail if exceeded
setting :default_queue_latency, 30
setting :workers_size, 0
setting :enqueued, 50

# name and password for basic auth
setting :name 
setting :password
```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
