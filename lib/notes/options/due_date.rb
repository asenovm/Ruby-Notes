module Notes
  module Options
    class DueDate
      def name
        :due_date
      end
      
      def description
        'Specify the due date for the note'
      end

      def type
        {:type => String }
      end
    end
  end
end
