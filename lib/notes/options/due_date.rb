module Notes
  module Options
    class DueDate < BaseOption
      def name
        Notes::Options::DUE_DATE
      end
      
      def description
        'Specify the due date for the note'
      end

      def options
        {:type => String, :multi => false }
      end
    end
  end
end
