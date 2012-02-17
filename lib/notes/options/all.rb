module Notes
  module Options
    class All
      def name
        Notes::Options::ALL
      end

      def description
        'Specified action is applied to all the matching notes'
      end

      def type
        {:type => nil}
      end
    end
  end
end

