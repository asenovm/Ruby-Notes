require 'set'
class Note

  attr_accessor :due_date, :description, :tags, :id

  def initialize
    @tags = Set.new
  end

  def add_tag(tag)
    @tags.add(tag)
  end

  def remove_tag(tag)
    @tags.delete(tag)
  end

  def remove_due_date
    @due_date = nil
  end

  def remove_description
    @description = nil
  end

  def get_tags_as_string
    res = ''
    @tags.each do |tag|
      res += tag
      res += ', '
    end
    res.chop!.chop!
  end

end
