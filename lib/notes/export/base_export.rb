module Notes
  class BaseExport
    private
    def get_tags_string tags
      if tags.kind_of? Array
        return Notes::ArrayUtil.array_to_string tags
      end
      tags
    end
  end
end
