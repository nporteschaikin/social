## Installation
```ruby
# Gemfile
gem 'social', git: 'git@github.com:nporteschaikin/social.git'
```
```ruby
# config/initializers/social.rb
Social::Engine.config.facebook_enabled = true
Social::Engine.config.facebook_page = ''
Social::Engine.config.facebook_app_id = ''
Social::Engine.config.facebook_app_secret = ''

Social::Engine.config.twitter_enabled = true
Social::Engine.config.twitter_username = ''
Social::Engine.config.twitter_consumer_key = ''
Social::Engine.config.twitter_consumer_secret = ''

Social::Engine.config.instagram_enabled = true
Social::Engine.config.instagram_username = ''
Social::Engine.config.instagram_client_id = ''
Social::Engine.config.instagram_client_secret = ''
Social::Engine.config.instagram_access_token = ''

Social::Engine.config.tumblr_enabled = true
Social::Engine.config.tumblr_address = ''
Social::Engine.config.tumblr_consumer_key = ''
```
## Import
```ruby
# run this regularly using background jobs/cron/etc.
Social::Import.create
```
## Usage
```ruby
# fetch all posts
@posts = Social::Post.all
```

More detailed documentation coming soon.
