module Notes
  module Options
    class Console < BaseOption
      def name
        Notes::Options::CONSOLE_EXPORT
      end

      def description
        'The result of this operation(if any) will be printed in the console'
      end
    end
  end
end
