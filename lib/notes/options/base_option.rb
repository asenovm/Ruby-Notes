module Notes
  module Options
    class BaseOption
      def name
        raise 'Unsupported operation'
      end

      def description
        raise 'Unsupported operation'
      end

      def options
        {:type => nil, :multi => false}
      end
    end
  end
end
