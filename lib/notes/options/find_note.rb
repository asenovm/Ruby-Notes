module Notes
  module Options
    class FindNote < BaseOption
      def name
        Notes::Options::FIND_NOTE
      end

      def description
        'Finds the note specified.'
      end
    end
  end
end
