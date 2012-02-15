module Notes
  class Note
    attr_reader :tag, :description, :due_date, :token

    def initialize options
      @tag = options[:tag]
      @description = options[:description]
      @due_date = options[:due_date]
      @token = options[:id]
    end

    def to_hash
      token = @tag.hash * 1231 + @description.hash * 1237 + @due_date.hash * 37
      { 'tag' => @tag, 'description' => @description, 'due_date' => @due_date, 'token' => token.to_s }
    end
  end
end
