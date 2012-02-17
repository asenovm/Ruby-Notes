module Notes
    class Criteria
      attr_reader :name, :value
      def initialize(name, value)
        @name = name
        @value = value
      end

      def to_hash
        if @value.kind_of? Array
          result_value = ''
          @value.each do |value|
            result_value += value
            result_value += ', '
          end
          return {@name => result_value.chop!.chop!}
        end
        {@name => @value}
      end
    end
end
