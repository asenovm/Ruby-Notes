module Notes
  module Options
    class RemoveNote
      def name
        Notes::Options::REMOVE_NOTE
      end

      def description
        'Removes the specified note'
      end

      def type
        {:type => nil}
      end
    end
  end
end
