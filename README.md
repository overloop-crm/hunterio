# Hunter

A ruby wrapper around Hunter.io API. Direct access to all the web's email addresses.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hunterio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hunterio

## Usage

```ruby
require 'hunterio'
hunter = Hunter.new('Your secret API key')

```
Your secret API key. You can generate it here (https://hunter.io/api_keys)

## Domain Search API
Returns all the email addresses found using one given domain name, with our sources.
```ruby
response = hunter.domain_search('stripe.com')
```

## Accessing response
```ruby
response.status
response.webmail
response.emails
response.pattern
```


## Email Verifier API
Allows you to verify the deliverability of an email address.
```ruby
response = hunter.email_verifier('vincenzo@prospect.io')
```

## Accessing response
```ruby
response.status
response.result
response.score
response.regexp
response.gibberish
response.disposable
response.webmail
response.mx_records
response.smtp_server
response.smtp_check
response.accept_all
response.sources
```

## Email Finder API
Guesses the most likely email of a person from his first name, his last name and a domain name.
```ruby
response = hunter.email_finder('Vincenzo', 'Ruggiero', {domain: 'prospect.io', company: 'Prospect.io'})
```

## Accessing response
```ruby
response.status
response.email
response.score
response.domain
```

## Email Count API
Returns the number of email addresses found for a domain. This is a FREE API call.
```ruby
response = hunter.email_count('prospect.io')
```

## Accessing count response
```ruby
response.status
response.total
response.personal_emails
response.generic_emails
```

## License
The Hunter GEM is released under the MIT License.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hunter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits
This gem is inspired by the [emailhunter gem](https://github.com/davidesantangelo/emailhunter) made by Davide Santangelo
