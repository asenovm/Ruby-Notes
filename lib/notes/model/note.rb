module Notes
  class Note
    attr_reader :tag, :description, :due_date, :token

    def initialize options
      @tag = options[:tag] ? options[:tag] : 'unspecified'
      @description = options[:description] ? options[:description] : 'unspecified'
      @due_date = options[:due_date] ? options[:due_date] : 'unspecified'
      @token = options[:id] ? options[:id] : 'unspecified'
    end

    def to_hash
      token = @tag.hash * 1231 + @description.hash * 1237 + @due_date.hash * 37
      { 'tag' => @tag, 'description' => @description, 'due_date' => @due_date, 'token' => token.to_s }
    end
  end
end
