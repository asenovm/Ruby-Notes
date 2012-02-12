module Notes
  module Options
    class Tag
      def name
        :tag
      end

      def description
        'Specified action only takes effect on notes with the tag given.'
      end

      def type
        {:type => String }
      end
    end
  end
end
