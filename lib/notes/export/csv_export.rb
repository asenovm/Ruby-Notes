module Notes
  class CsvExport
    CSV_VALUE_SEPARATOR = ', '

    def initialize output_file_path
      @file = File.new output_file_path, 'w+'
    end

    def export_notes notes_list
      res = ''
      notes_list.each do |note|
        res += export_note note
        res += '\n'
      end
      @file.puts res
    end

    def export_note note_hash
      res = note_hash['token']  + CSV_VALUE_SEPARATOR + note_hash['tag'] + CSV_VALUE_SEPARATOR
      res += '"' + note_hash['description'] + '"' + CSV_VALUE_SEPARATOR + note_hash['due_date']
      res
    end
  end
end
