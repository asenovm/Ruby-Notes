module Notes
  class CsvExport
    CSV_VALUE_SEPARATOR = ', '

    def export_note note_hash
      res = note_hash['id'] + CSV_VALUE_SEPARATOR + note_hash['tag'] + CSV_VALUE_SEPARATOR
      res += '"' + note_hash['description'] + '"' + CSV_VALUE_SEPARATOR + note_hash['due_date']
      res
    end
  end
end
