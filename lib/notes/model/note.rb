module Notes
  class Note
    attr_reader :tag, :description, :due_date
    def initialize options
      @tag = options[:tag]
      @description = options[:desc]
      @due_date = options[:due_date]
    end

    def to_hash
      { 'tag' => @tag, 'description' => @description, 'due_date' => @due_date}
    end
  end
end
