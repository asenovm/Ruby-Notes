module Notes
  module Options
    class Tag < BaseOption
      def name
        Notes::Options::TAG
      end

      def description
        'Specified action only takes effect on notes with the tag given.'
      end

      def options
        {:type => String, :multi => true}
      end
    end
  end
end
