# CP_AWS
Cloud Portal plugin to support AWS.

This currently only supports creating EC2 instances.

## Usage
This is used as a plugin with the [Cloud Portal](https://github.com/Joelith/cloudportal) project and will not work stand-alone

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cp_aws'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install cp_aws
```

Configuration options need to be added as an initializer in your app. Eg: in config/initializers/cp_aws.rb
```ruby
CpAws.setup do |config|
  config.aws_access_key_id = "fakeId"
  config.aws_secret_access_key = "s3cr3t"
  config.region = "us-west-2"
  config.active_components = ['EC2']
end
```

## Contributing
1. Fork it ( https://github.com/Joelith/cp_aws )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
