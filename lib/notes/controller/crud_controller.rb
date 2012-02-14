module Notes
  class CRUDController
    def initialize options
      @options = options
      if options[:console]
        @export = ConsoleExport.new
      elsif options[:html]
        @export = HtmlExport.new
      elsif options[:csv]
        @export = CSVExport.new
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
      @db_controller.remove Criteria.new @options
    end

    def update
      @db_controller.update Note.new(@options), Criteria.new(@options)
    end

    def find
      result_collection = @db_controller.find Criteria.new @options
      result_collection.each do |entry|
        p @export.export_note entry 
      end
    end
  end
end
