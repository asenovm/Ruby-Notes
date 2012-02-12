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

  def self.export(note_list)
    notes_export = TABLE
    note_list.each do |note|
      notes_export += note_to_html(note)
    end
    notes_export += get_closing_tag(TABLE)
    attach_headers(notes_export)
  end

  def self.note_to_html(note)
    res = TABLE_ROW
    res += TABLE_CELL + note.id + get_closing_tag(TABLE_CELL)
    res += TABLE_CELL + note.get_tags_as_string + get_closing_tag(TABLE_CELL)
    res += TABLE_CELL + note.description + get_closing_tag(TABLE_CELL)
    res += TABLE_CELL + note.due_date + get_closing_tag(TABLE_CELL)
    res += get_closing_tag(TABLE_ROW)
    res
  end

  def self.attach_headers(html_body)
    res = DOCTYPE  + HTML + HEAD + ENCODING
    res += TITLE + get_closing_tag(HEAD) 
    res += BODY + html_body + get_closing_tag(BODY) + get_closing_tag(HTML)
    res
  end

  def self.get_closing_tag(opening_tag)
    opening_tag.sub("<","</")
  end
end
