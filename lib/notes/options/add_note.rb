module Notes
  module Options
    class AddNote
      def name
        Notes::Options::ADD_NOTE
      end

      def description
        'Add a new note with the parameters specified'
      end

      def type
        { :type => nil }
      end
    end
  end
end
