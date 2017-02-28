module EvernoteBackup
  module Configuration
    mattr_accessor :aws_access_key_id, :aws_secret_access_key, :evernote_token,
                   :storage

    def self.configuration
      yield self
    end
  end
end
