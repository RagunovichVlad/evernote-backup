require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/inflector'
require "evernote_oauth"
require 'aws-sdk'
require "evernote-backup/version"
require "evernote-backup/evernote/client"
require "evernote-backup/exporter"
require "evernote-backup/storage/aws"
require "evernote-backup/note_uploader"

module EvernoteBackup
  mattr_accessor :aws_access_key_id, :aws_secret_access_key, :evernote_token,
                 :storage, :aws_region, :bucket_name, :notebook_stack

  def self.configuration
    yield self
  end
end
