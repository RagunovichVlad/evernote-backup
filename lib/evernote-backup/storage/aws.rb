module EvernoteBackup
  module Storage
    class Aws

      def upload(name:, content:)
        client.bucket(bucket_name).object(name).put(body: content)
      end

      private

      def bucket_name
        EvernoteBackup.bucket_name
      end

      def client
        @client ||= ::Aws::S3::Resource.new(
          credentials: credentials,
          region: EvernoteBackup.aws_region
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
