module Notes
  class ConsoleExport
    ID_FIELD_LENGTH =  20
    TAG_FIELD_LENGTH = 35
    DESCRIPTION_FIELD_LENGTH = 70
    DUE_DATE_FIELD_LENGTH = 14
    HEADER = '+' + '-' * (ID_FIELD_LENGTH + TAG_FIELD_LENGTH + DESCRIPTION_FIELD_LENGTH + DUE_DATE_FIELD_LENGTH + 3) + '+'
    ID = 'ID'
    TAG = 'TAG'
    DESCRIPTION = 'DESCRIPTION'
    DUE_DATE = 'DUE DATE'

    def export_notes note_list
      result = HEADER + "\n"
      heading = center_in_container(ID_FIELD_LENGTH, ID) + center_in_container(TAG_FIELD_LENGTH, TAG)
      heading += center_in_container(DESCRIPTION_FIELD_LENGTH, DESCRIPTION) + center_in_container(DUE_DATE_FIELD_LENGTH, DUE_DATE)
      result +=  heading + '|' + "\n"
      result +=  HEADER + "\n"
      note_list.each do |note|
        result += export_note note
        result += "\n"
      end
      result += HEADER + "\n"
      result
    end

    def export_note(note_hash)
      result = center_in_container(ID_FIELD_LENGTH, note_hash[Options::TOKEN.to_s])
      result += center_in_container(TAG_FIELD_LENGTH, get_tags_string(note_hash[Options::TAG.to_s]))
      result += center_in_container(DESCRIPTION_FIELD_LENGTH, note_hash[Options::DESCRIPTION.to_s])
      result += center_in_container(DUE_DATE_FIELD_LENGTH, note_hash[Options::DUE_DATE.to_s])
      result += '|'
      result
    end
    
    private
    def center_in_container(container_length, content)
      '|' + ' ' * ((container_length - content.length)/2.0).floor + content + ' ' * ((container_length - content.length)/2.0).ceil
    end

    def get_tags_string tags
      if tags.kind_of? Array
        tags_set = Set.new tags
        result = ''
        tags_set.each do |tag|
          result += tag
          result += ', '
        end
        return result.chop!.chop!
      end
      tags
    end

  end
end
