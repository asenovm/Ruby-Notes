module Notes
  class HtmlExport 
    DOCTYPE = '<!DOCTYPE html>'
    HTML = '<html>'
    HEAD = '<head>'
    BODY = '<body>'
    ENCODING = '<meta http-equiv="content-type" content="text/html; charset=utf-8" />'
    TITLE = '<title>Notes</title>'
    TABLE = '<table>'
    TABLE_ROW = '<tr>'
    TABLE_CELL = '<td>'

    def initialize output_file_path
      @file = File.new output_file_path , 'w+'
    end

    def export_notes notes_list
      res = TABLE 
      notes_list.each do |note|
        res += export_note note
      end
      res += get_closing_tag TABLE
      @file.puts(attach_headers res)
    end

    def export_note note_hash
      res = TABLE_ROW
      res += TABLE_CELL + note_hash['tag'] + get_closing_tag(TABLE_CELL)
      res += TABLE_CELL + note_hash['description'] + get_closing_tag(TABLE_CELL)
      res += TABLE_CELL + note_hash['due_date'] + get_closing_tag(TABLE_CELL)
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
