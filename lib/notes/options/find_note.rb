module Notes
  module Options
    class FindNote
      def name
        Notes::Options::FIND_NOTE
      end

      def description
        'Finds the note specified.'
      end

      def type
        {:type => nil }
      end
    end
  end
end
