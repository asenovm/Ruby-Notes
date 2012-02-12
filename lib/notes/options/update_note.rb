module Notes
  module Options
    class UpdateNote
      def name
        :update_note
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
