module Notes
  module Options
    class Options
      def self.get_options
        [AddNote.new, RemoveNote.new, FindNote.new, UpdateNote.new, Tag.new, Description.new, DueDate.new, Id.new]
      end
    end
  end
end
