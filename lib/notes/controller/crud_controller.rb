module Notes
  class CRUDController
    def initialize options
      @options = options
      @db_controller = DatabaseController.new
    end
  end
end
