module Notes
  class CsvExport < BaseExport
    CSV_VALUE_SEPARATOR = ', '

    def initialize output_file_path
      @file = File.new output_file_path, 'w+'
    end

    def export_notes notes_list
      res = TOKEN + CSV_VALUE_SEPARATOR + TAG + CSV_VALUE_SEPARATOR + DESCRIPTION + CSV_VALUE_SEPARATOR + DUE_DATE + "\n"
      notes_list.each do |note|
        res += export_note note
        res += "\n"
      end
      res.chomp! "\n"
      @file.puts res
      @file.close
    end

    def export_note note_hash
      res = note_hash[Options::TOKEN.to_s]  + CSV_VALUE_SEPARATOR + get_tags_string(note_hash[Options::TAG.to_s])
      res +=  CSV_VALUE_SEPARATOR + '"' + note_hash[Options::DESCRIPTION.to_s] + '"'
      res += CSV_VALUE_SEPARATOR + note_hash[Options::DUE_DATE.to_s]
      res
    end
  end
end
