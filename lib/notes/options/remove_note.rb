module Notes
  module Options
    class RemoveNote
      def name
        :remove
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
