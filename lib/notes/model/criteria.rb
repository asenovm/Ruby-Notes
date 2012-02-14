module Notes
    class Criteria
      attr_reader :name, :value
      def initialize options
        if options[:tag]
          @name = 'tag'
          @value = options[:tag]
        elsif options[:desc]
          @name = 'description'
          @value = options[:desc]
        elsif options[:id]
          @name = 'id'
          @value = options[:id]
        elsif options[:due_date]
          @name = 'due_date'
          @value = options[:due_date]
        end
      end
    end
end
