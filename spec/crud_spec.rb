describe Notes::CRUDController do
  describe 'it correctly performs action' do
    
    before do
      @crud_controller = Notes::CRUDController.new 'test'
      @db_manager = Notes::DatabaseManager.new 'test'
    end

    after do
      @crud_controller.perform_action({Notes::Options::REMOVE_NOTE => true, Notes::Options::ALL => true})
    end

    it 'creates new note' do
      @crud_controller.perform_action({Notes::Options::ADD_NOTE => true})
      result_count = 0
      @db_manager.get_all_records.each do |record|
        result_count += 1
      end
      result_count.should eq 1
    end

    it 'removes note' do
      @crud_controller.perform_action({Notes::Options::ADD_NOTE => true, Notes::Options::TAG => 'to do'})
      @crud_controller.perform_action({Notes::Options::REMOVE_NOTE => true, Notes::Options::TAG => 'to do'})
      result_count = 0
      @db_manager.get_all_records.each do |record|
        result_count += 1
      end
      result_count.should eq 0
    end

    it 'can find a note' do
      @crud_controller.perform_action({Notes::Options::ADD_NOTE => true})
      $stdout.should_receive (:puts)
      test_hash = {}
      test_hash[Notes::Options::FIND_NOTE] = true
      test_hash[Notes::Options::ALL] = true
      test_hash[Notes::Options::CONSOLE_EXPORT] = true
      @crud_controller.perform_action test_hash
    end
  end
end
