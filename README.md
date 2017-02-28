# EvernoteBackup

Ruby gem that can take all of the nodes from an Evernote account and backup them to S3 bucket in tree-like structure like this:

```
 bucket_name\:notebook_stack\:notebook\:note_name\(note_text|note_attachments)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'evernote-backup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install evernote-backup

## Usage

First of all, setup configuration:

```ruby
EvernoteBackup.configuration do |config|
  config.storage = :aws
  config.aws_access_key_id = 'aws_access_key_id'
  config.aws_secret_access_key = 'aws_secret_access_key'
  config.aws_region = 'us-west-2'
  config.bucket_name = 'bucket_name'
  config.evernote_token = 'evernote_token'
  config.notebook_stack = 'notebook_stack'
end
```

To create the Evernote API developer token go to
[Developer Tokens](https://dev.evernote.com/doc/articles/dev_tokens.php)

And then export data:

```ruby
EvernoteBackup::Exporter.new.export
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RagunovichVlad/evernote-backup. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
