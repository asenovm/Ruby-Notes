module Notes
  module Options
    class Token < BaseOption
      def name
        Notes::Options::TOKEN
      end
      
      def description
        'Specified action is only applied to the note with the id given.'
      end

      def options
        { :type => String, :multi => false}
      end
    end
  end
end
