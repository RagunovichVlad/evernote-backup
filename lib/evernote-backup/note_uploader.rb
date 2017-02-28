module EvernoteBackup
  class NoteUploader
    attr_reader :note, :notebook_name

    def initialize(note:, notebook_name:)
      @note = note
      @notebook_name = notebook_name
    end

    def upload
      upload_note_content
      upload_note_resources if note.resources
    end

    private

    def upload_note_resources
      note.resources.each do |resource|
        file = create_file(
          content: resource.data.body,
          name: resource.attributes.fileName,
          content_type: resource.mime
        )
        upload_file(file)
      end
    end

    def upload_note_content
      file = create_file(
        content: note.content,
        name: 'content.xml',
        content_type: 'text/xml'
      )
      upload_file(file)
    end

    def upload_file(file)
      storage.upload(name: note_full_path(file), content: file)
    end

    def storage
      "EvernoteBackup::Storage::#{storage_name}".constantize.new
    end

    def storage_name
      EvernoteBackup.storage.capitalize
    end

    def note_full_path(file)
      [notebook_stack, notebook_name, note.title,
        file.original_filename].join('/')
    end

    def notebook_stack
      EvernoteBackup.notebook_stack
    end

    def create_file(content:, name:, content_type:)
      file = StringIO.new(content)
      file.class.class_eval { attr_accessor :original_filename, :content_type }
      file.original_filename = name
      file.content_type = content_type
      file
    end
  end
end
