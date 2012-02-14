module Notes
  class CRUDController
    def initialize options
      @options = options
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
      @db_controller.find Criteria.new @options
    end
  end
end
