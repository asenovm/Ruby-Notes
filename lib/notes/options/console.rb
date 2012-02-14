module Notes
  module Options
    class Console
      def name
        :console
      end

      def description
        'The result of this operation(if any) will be printed in the console'
      end

      def type
        { :type => nil } 
      end
    end
  end
end
