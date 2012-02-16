module Notes
  module Options
    class Current
      def name
        Notes::Options::CURRENT
      end

      def type
        {:type => nil}
      end
      
      def description
        'Specified action will only be applied to notes with current data that is after or coincides with the current day.'
      end
    end
  end
end
