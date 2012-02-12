module Notes
  module Options
    class FindNote
      def name
        :find_note
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
