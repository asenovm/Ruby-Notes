module Notes
  module Options
    class Description < BaseOption
      def name
        Notes::Options::DESCRIPTION
      end

      def description
        'Specify the description for the note'
      end
      
      def options
        {:type => String, :multi => false }
      end
    end
  end
end
