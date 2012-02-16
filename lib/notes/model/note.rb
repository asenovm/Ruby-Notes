module Notes
  class Note
    attr_reader :tag, :description, :due_date, :token

    def initialize options
      @tag = options[Options::TAG] ? options[Options::TAG] : 'unspecified'
      @description = options[Options::DESCRIPTION] ? options[Options::DESCRIPTION] : 'unspecified'
      @due_date = options[Options::DUE_DATE] ? options[Options::DUE_DATE] : 'unspecified'
      @token = options[Options::ID] ? options[Options::ID] : 'unspecified'
    end

    def to_hash
      { Options::TAG.to_s  => @tag, Options::DESCRIPTION.to_s => @description, Options::DUE_DATE.to_s => @due_date, Options::TOKEN.to_s => get_token.to_s }
    end

    def get_token
      @tag.hash * 1231 + @description.hash * 1237 + @due_date.hash * 37
    end
  end
end
