module Notes
  module Options
    class Description
      def name
        Notes::Options::DESCRIPTION
      end

      def description
        'Specify the description for the note'
      end
      
      def type
        {:type => String }
      end
    end
  end
end
