module Notes
  module Options
    class AddNote < BaseOption
      def name
        Notes::Options::ADD_NOTE
      end

      def description
        'Add a new note with the parameters specified'
      end
    end
  end
end
