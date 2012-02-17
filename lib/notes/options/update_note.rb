module Notes
  module Options
    class UpdateNote < BaseOption
      def name
        Notes::Options::UPDATE_NOTE
      end

      def description
        'Update the note given'
      end
    end
  end
end
