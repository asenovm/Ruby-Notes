module Notes
  module Options
    class Options
      def self.get_options
        options = [AddNote.new, RemoveNote.new, FindNote.new, UpdateNote.new]
        options += [Tag.new, Description.new, DueDate.new, Id.new, Html.new]
        options += [CSV.new, Console.new, Current.new, All.new]
        options
      end
    end
  end
end
