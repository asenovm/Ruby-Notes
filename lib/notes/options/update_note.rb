module Notes
  module Options
    class UpdateNote
      def name
        Notes::Options::UPDATE_NOTE
      end

      def description
        'Update the note given'
      end

      def type
        {:type => nil}
      end
    end
  end
end
