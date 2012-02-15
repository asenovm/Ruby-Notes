module Notes
  class ConsoleExport
    ID_FIELD_LENGTH =  30
    TAG_FIELD_LENGTH = 20
    DESCRIPTION_FIELD_LENGTH = 60
    DUE_DATE_FIELD_LENGTH = 14
    HEADER = '+' + '-' * (ID_FIELD_LENGTH + TAG_FIELD_LENGTH + DESCRIPTION_FIELD_LENGTH + DUE_DATE_FIELD_LENGTH + 3) + '+'
    ID = 'ID'
    TAG = 'TAG'
    DESCRIPTION = 'DESCRIPTION'
    DUE_DATE = 'DUE DATE'

    def export_notes note_list
      puts HEADER
      heading = center_in_container(ID_FIELD_LENGTH, ID) + center_in_container(TAG_FIELD_LENGTH, TAG)
      heading += center_in_container(DESCRIPTION_FIELD_LENGTH, DESCRIPTION) + center_in_container(DUE_DATE_FIELD_LENGTH, DUE_DATE)
      puts heading + '|'
      puts HEADER
      note_list.each do |note|
        export_note note
      end
      puts HEADER
    end

    def export_note(note_hash)
      result = center_in_container(ID_FIELD_LENGTH, note_hash['token'])
      result += center_in_container(TAG_FIELD_LENGTH, note_hash['tag'])
      result += center_in_container(DESCRIPTION_FIELD_LENGTH, note_hash['description'])
      result += center_in_container(DUE_DATE_FIELD_LENGTH, note_hash['due_date'])
      result += '|'
      puts result
    end
    
    private
    def center_in_container(container_length, content)
      '|' + ' ' * ((container_length - content.length)/2.0).floor + content + ' ' * ((container_length - content.length)/2.0).ceil
    end

  end
end
