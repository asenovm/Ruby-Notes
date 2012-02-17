module Notes
  module Options
    class Id < BaseOption
      def name
        Notes::Options::ID
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
