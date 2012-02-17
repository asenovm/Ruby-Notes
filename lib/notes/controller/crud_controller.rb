module Notes
  class CRUDController
    def initialize collection_name
      @db_controller = DatabaseController.new collection_name
    end

    def perform_action options
      init options
      if @options[Options::ADD_NOTE]
        create
      elsif @options[Options::REMOVE_NOTE]
        remove
      elsif @options[Options::UPDATE_NOTE]
        update
      elsif @options[Options::FIND_NOTE]
        find
      end
    end

    private
    def init options
      @options = options
      @criterias = get_criterias
      if options[Options::CONSOLE_EXPORT]
        @export = ConsoleExport.new
      elsif options[Options::HTML_EXPORT]
        @export = HtmlExport.new options[Options::HTML_EXPORT]
      elsif options[Options::CSV_EXPORT]
        @export = CsvExport.new options[Options::CSV_EXPORT]
      end
    end

    def create
      @db_controller.create Note.new @options
    end

    def remove
      @db_controller.remove @criterias
    end

    def update
      @db_controller.update Note.new(@options), @criterias
    end

    def find
      result_collection = @db_controller.find @criterias
      if result_collection
        puts @export.export_notes result_collection
      end
    end

    def get_criterias
      result = []
      criterias = [Options::TAG, Options::DESCRIPTION, Options::CURRENT, Options::DUE_DATE, Options::TOKEN , Options::ALL]
      @options.each do |key, value|
        if criterias.include?(key) && @options[key] && @options[key] != []
          result << Criteria.new(key.to_s, value)
        end
      end
      result
    end
  end
end
