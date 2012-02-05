class ConsoleExport
  ID_FIELD_LENGTH =  6
  TAG_FIELD_LENGTH = 20
  DESCRIPTION_FIELD_LENGTH = 60
  DUE_DATE_FIELD_LENGTH = 14

  def self.export(notes_list)
    res = String.new
    notes_list.each do |note|
      res += export_note note
    end
    res
  end

  def self.export_note(note)
    result = center_in_container(ID_FIELD_LENGTH,  note.id)
    result += center_in_container(TAG_FIELD_LENGTH, note.get_tags_as_string)
    result += center_in_container(DESCRIPTION_FIELD_LENGTH, note.description)
    result += center_in_container(DUE_DATE_FIELD_LENGTH, note.due_date)
    result + '|'
  end

  def self.center_in_container(container_length, content)
    '|' + ' ' * ((container_length - content.length)/2) + content + ' ' * ((container_length - content.length)/2)
  end
end
