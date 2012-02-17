module Notes
  module Options
    class All < BaseOption
      def name
        Notes::Options::ALL
      end

      def description
        'Specified action is applied to all the matching notes'
      end
    end
  end
end

