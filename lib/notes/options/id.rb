module Notes
  module Options
    class Id
      def name
        :id
      end
      
      def description
        'Specified actions is only applied to the note with the id given.'
      end

      def type
        { :type => Integer }
      end
    end
  end
end
