# Rgcm

[![Build Status](https://api.travis-ci.org/aklaiber/rgcm.svg)][travis]
[![Gem Version](http://img.shields.io/gem/v/rgcm.svg)][gem]
[![Code Climate](https://codeclimate.com/github/aklaiber/rgcm.png)][codeclimate]
[![Dependencies Status](http://img.shields.io/gemnasium/aklaiber/rgcm.svg)][gemnasium]

[travis]: https://travis-ci.org/aklaiber/rgcm
[gem]: https://rubygems.org/gems/rgcm
[codeclimate]: https://codeclimate.com/github/aklaiber/rgcm
[gemnasium]: https://gemnasium.com/aklaiber/rgcm


Ruby mapper for [Google Cloud Messaging](http://developer.android.com/guide/google/gcm/index.html)

## Installation

Add this line to your application's Gemfile:

    gem 'rgcm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rgcm

## Usage

``` ruby
Rgcm::Message.new('_API_KEY_').post('_GCM_REGESTRATION_ID_', { foo: 'bar' }) # => Rgcm::Response

Rgcm::Message.new('_API_KEY_').post(['_GCM_REGESTRATION_ID_1_', '_GCM_REGESTRATION_ID_2_'], { foo: 'bar' }) # => Rgcm::Response
```

With collapse_key:

``` ruby
Rgcm::Message.new('_API_KEY_').post('_GCM_REGESTRATION_ID_', { foo: 'bar' }, {collapse_key: 'collapse_key'}) # => Rgcm::Response
```

With time_to_live:

``` ruby
Rgcm::Message.new('_API_KEY_').post('_GCM_REGESTRATION_ID_', { foo: 'bar' }, {time_to_live: 3}) # => Rgcm::Response
```


With rails YML config file:

``` yml
development:
  api_key: '_API_KEY_'

test:
  api_key: '_API_KEY_'

production:
  api_key: '_API_KEY_'
```

``` ruby
Rgcm::Message.new.post('_GCM_REGESTRATION_ID_', { foo: 'bar' }) # => Rgcm::Response

Rgcm::Message.new.post(['_GCM_REGESTRATION_ID_1_', '_GCM_REGESTRATION_ID_2_'], { foo: 'bar' }) # => Rgcm::Response
```

Rgcm::Response methods:

```json
{
    "multicast_id":5030383832068975557,
    "success":1,
    "failure":0,
    "canonical_ids":0,
    "results":[
        { "message_id":"0:1403425286258916%62dfd0f6e116c072" }
    ]
}
```

``` ruby
response = Rgcm::Message.new('_API_KEY_').post('_GCM_REGESTRATION_ID_', { foo: 'bar' })

response.count_successes # => 1
response.count_failures # => 0
response.has_successes? # => true
response.has_failures? # => false
response.results # => '{ "message_id":"0:1403425286258916%62dfd0f6e116c072" }' 
response.successes # => '{ "message_id":"0:1403425286258916%62dfd0f6e116c072" }' 
response.errors # => nil
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rgcm/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
