module Notes
  module Options
    class CSV < BaseOption
      def name
        Notes::Options::CSV_EXPORT
      end

      def options
        { :type => String, :multi => false}
      end

      def description
        'The result of this operation(if any) will be printed in the file specified in csv format.'
      end
    end
  end
end

