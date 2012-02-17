module Notes
  module Options
    class RemoveNote < BaseOption
      def name
        Notes::Options::REMOVE_NOTE
      end

      def description
        'Removes the specified note'
      end
    end
  end
end
