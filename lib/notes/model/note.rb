module Notes
  class Note
    attr_reader :tag, :description, :due_date, :token

    def initialize options
      @tag = (options[Options::TAG] && options[Options::TAG] != [])? options[Options::TAG] : 'unspecified'
      @description = options[Options::DESCRIPTION] ? options[Options::DESCRIPTION] : 'unspecified'
      @due_date = options[Options::DUE_DATE] ? options[Options::DUE_DATE] : 'unspecified'
      @token = options[Options::TOKEN] ? options[Options::TOKEN] : 'unspecified'
    end

    def to_hash
      result_hash = {}
      result_hash[Options::TAG.to_s] = @tag
      result_hash[Options::DESCRIPTION.to_s] = @description
      result_hash[Options::DUE_DATE.to_s] =  @due_date
      result_hash[Options::TOKEN.to_s] = get_token.to_s
      result_hash
    end

    def get_token
      @tag.hash * 1231 + @description.hash * 1237 + @due_date.hash * 37
    end
  end
end
