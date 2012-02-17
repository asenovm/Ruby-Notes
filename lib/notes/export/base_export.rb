module Notes
  class BaseExport

    TOKEN = 'TOKEN'
    TAG = 'TAG'
    DESCRIPTION = 'DESCRIPTION'
    DUE_DATE = 'DUE DATE'

    private
    def get_tags_string tags
      if tags.kind_of? Array
        return Notes::ArrayUtil.array_to_string tags
      end
      tags
    end
  end
end
