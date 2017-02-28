module EvernoteBackup
  class Exporter

    def export
      evernote_client.notes.each { |note| upload_note(note) }
    end

    private

    def upload_note(note)
      NoteUploader.new(
        note: note,
        notebook_name: notebook_name(note)
      ).upload
    end

    def notebook_name(note)
      evernote_client.notebooks[note.notebookGuid]
    end

    def evernote_client
      @evernote_client ||= Evernote::Client.new
    end
  end
end
