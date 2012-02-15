module Notes
  class CRUDController
    def initialize options
      @options = options
      @criterias = get_criterias
      if options[:console]
        @export = ConsoleExport.new
      elsif options[:html]
        @export = HtmlExport.new options[:html]
      elsif options[:csv]
        @export = CsvExport.new options[:csv]
      end
      @db_controller = DatabaseController.new
    end

    def perform_action
      if @options[:add_note]
        insert
      elsif @options[:remove_note]
        remove
      elsif @options[:update_note]
        update
      elsif @options[:find_note]
        find
      end
    end

    private
    def insert
      @db_controller.insert Note.new @options
    end

    def remove
      @db_controller.remove @criterias
    end

    def update
      @db_controller.update Note.new(@options), @criterias
    end

    def find
      result_collection = @db_controller.find @criterias
      @export.export_notes result_collection
    end

    def get_criterias
      result = []
      criterias = [:tag, :description, :current, :due_date, :token]
      @options.each do |key, value|
        if criterias.include?(key) && @options[key]
          result << Criteria.new(key.to_s, value)
        end
      end
      result
    end
  end
end
