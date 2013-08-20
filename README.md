# ShippingLabel

Shipping label is used to modify links in Rails mailers to include a set of
query parameters. This is useful when adding Google Analytics or other tracking
data to links. Shipping label supports adding class and mailer level parameters.
See usage for more information.

Shipping label is based on [GoogleAnalyticsMailer][GAM] but adds support for
Rails 4 and is not restricted to adding Google Analytics parameters only.

[GAM]:https://github.com/fabn/google_analytics_mailer

## Installation

Add this line to your application's Gemfile:

    gem 'shipping_label'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shipping_label

## Usage

`ActionMailer::Base` will automatically extend `ShippingLabel` when
`ShippingLabel` is required. To set parameters for every mailer in your class,
use the class-level `shipping_label_parameters` method. To override or add
additional parameters to an individual mailer, use
`override_shipping_parameters` in that mailer method.

Here's an example which sets some parameters at the class level and uses a
before filter to set the campaign based on the action.

```ruby
class UserMailer < ActionMailer::Base
  shipping_label utm_medium: :email, utm_source: Rails.env
  before_action :set_campaign

  def welcome
    #...
  end

  def password_reset
    #...
  end

  private

  def set_campaign
    override_shipping_label(utm_campaign: action_name)
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
