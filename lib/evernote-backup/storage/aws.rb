module EvernoteBackup
  module Storage
    class Aws

      ACCESS_KEY_ID =  'AKIAIVF2NOL6ZQPTRLIQ'
      SECRET_ACCESS_KEY = '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'

      def upload_file(name, content)
        client.bucket('rag-evernote').object(file_name(name)).put(body: content)
      end

      def file_name(name)
        "#{notebook_stack}/#{name}"
      end

      def notebook_stack
        'evernote-gem'
      end

      def client
        @client ||= ::Aws::S3::Resource.new(
          credentials: credentials,
          region: 'us-west-2'
        )
      end

      def credentials
        @credentials ||= ::Aws::Credentials.new(
          EvernoteBackup.aws_access_key_id,
          EvernoteBackup.aws_secret_access_key
        )
      end
    end
  end
end
