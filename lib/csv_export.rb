class CsvExport

  CSV_VALUE_SEPARATOR = ', '

  def self.export(note_list)
    res = String.new
    note_list.each do |note|
      res += export_note(note)
      res += '\n'
    end
    res
  end

  private
  def self.export_note(note)
    res = note.id + CSV_VALUE_SEPARATOR + note.get_tags_as_string + CSV_VALUE_SEPARATOR
    res += '"' + note.description + '"' + CSV_VALUE_SEPARATOR + note.due_date
  end
end
