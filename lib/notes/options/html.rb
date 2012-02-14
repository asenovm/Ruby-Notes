module Notes
  module Options
    class Html
      def name
        :html
      end

      def type
        { :type => String }
      end

      def description
        'The result of this operation(if any) will be saved into the file given in html format'
      end
    end
  end
end
