module Notes
  module Options
    class Current < BaseOption
      def name
        Notes::Options::CURRENT
      end

      def description
        'Specified action will only be applied to notes with due date that is after or coincides with the current day.'
      end
    end
  end
end
