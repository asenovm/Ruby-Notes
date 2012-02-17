module Notes
    class Criteria
      attr_reader :name, :value
      def initialize(name, value)
        @name = name
        @value = value
      end

      def to_hash
        if @value.kind_of? Array
          return {@name => (Notes::ArrayUtil.array_to_string @value)}
        end
        {@name => @value}
      end
    end
end
