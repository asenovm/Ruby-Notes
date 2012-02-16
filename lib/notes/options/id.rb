module Notes
  module Options
    class Id
      def name
        Notes::Options::ID
      end
      
      def description
        'Specified action is only applied to the note with the id given.'
      end

      def type
        { :type => String}
      end
    end
  end
end
