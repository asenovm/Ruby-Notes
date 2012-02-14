module Notes
  module Options
    class CSV

      def name
        :csv
      end

      def type
        { :type => String}
      end

      def description
        'The result of this operation(if any) will be printed in the file specified in csv format.'
      end
    end
  end
end

