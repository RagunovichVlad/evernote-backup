require 'active_support/core_ext/module/attribute_accessors'
require "evernote_oauth"
require 'aws-sdk'
require "evernote-backup/version"
require "evernote-backup/evernote/client"
require "evernote-backup/exporter"
require "evernote-backup/storage/aws"
require "evernote-backup/configuration"

module EvernoteBackup
  extend Configuration
end
