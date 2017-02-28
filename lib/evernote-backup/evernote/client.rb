module EvernoteBackup
  module Evernote
    class Client

      def notebooks
        @notebooks ||= notebook_list.each_with_object({}) do |notebook ,hash|
          hash[notebook.guid] = notebook.name
        end
      end

      def notes
        note_list.map do |note|
          note_store.getNote(dev_token, note.guid, true, true, true, true)
        end
      end

      private

      def client
        @client ||= ::EvernoteOAuth::Client.new(token: dev_token, sandbox: false)
      end

      def note_store
        @note_store ||= client.note_store
      end

      def notebook_list
        note_store.listNotebooks(dev_token)
      end

      def note_list
        note_store.findNotes(dev_token, filter, 0, notes_count).notes
      end

      def filter
        @filter ||= ::Evernote::EDAM::NoteStore::NoteFilter.new
      end

      def notes_count
        note_store.findNotes(dev_token, filter, 0, nil).totalNotes
      end

      def token
        EvernoteBackup.evernote_token
      end
    end
  end
end
