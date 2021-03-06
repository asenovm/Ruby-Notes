module Notes
  class HtmlExport  < BaseExport
    DOCTYPE = '<!DOCTYPE html>'
    HTML = '<html>'
    HEAD = '<head>'
    BODY = '<body>'
    ENCODING = '<meta http-equiv="content-type" content="text/html; charset=utf-8" />'
    TITLE = '<title>Notes</title>'
    TABLE = '<table style="text-align: center;">'
    TABLE_ROW = '<tr>'
    TABLE_CELL = '<td>'

    def initialize output_file_path
      @file = File.new output_file_path , 'w+'
    end

    def export_notes notes_list
      res = TABLE + TABLE_ROW  + TABLE_CELL + TOKEN + get_closing_tag(TABLE_CELL) + TABLE_CELL + TAG + get_closing_tag(TABLE_CELL)
      res += TABLE_CELL + DESCRIPTION + get_closing_tag(TABLE_CELL) + TABLE_CELL + DUE_DATE + get_closing_tag(TABLE_CELL)
      res += get_closing_tag(TABLE_ROW)
      notes_list.each do |note|
        res += export_note note
      end
      res += get_closing_tag TABLE
      @file.puts(attach_headers res)
      @file.close
    end

    def export_note note_hash
      res = TABLE_ROW
      res += TABLE_CELL + note_hash[Notes::Options::TOKEN.to_s] + get_closing_tag(TABLE_CELL)
      res += TABLE_CELL + get_tags_string(note_hash[Notes::Options::TAG.to_s]) + get_closing_tag(TABLE_CELL)
      res += TABLE_CELL + note_hash[Notes::Options::DESCRIPTION.to_s] + get_closing_tag(TABLE_CELL)
      res += TABLE_CELL + note_hash[Notes::Options::DUE_DATE.to_s] + get_closing_tag(TABLE_CELL)
      res += get_closing_tag(TABLE_ROW)
      res
    end

    private
    def attach_headers html_body
      res = DOCTYPE  + HTML + HEAD + ENCODING
      res += TITLE + get_closing_tag(HEAD) 
      res += BODY + html_body + get_closing_tag(BODY) + get_closing_tag(HTML)
      res
    end

    def get_closing_tag opening_tag
      opening_tag.sub("<","</")
    end
  end
end
