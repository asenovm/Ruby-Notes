describe Notes::CRUDController do
  describe 'it correctly performs action' do
    
    before do
      @crud_controller = Notes::CRUDController.new 'test'
      @db_controller = Notes::DatabaseController.new 'test'
    end

    after do
      @crud_controller.perform_action({Notes::Options::REMOVE_NOTE => true, Notes::Options::ALL => true})
    end

    it 'creates new note' do
      @crud_controller.perform_action({Notes::Options::ADD_NOTE => true})
      result_count = 0
      @db_controller.get_all_records.each do |record|
        result_count += 1
      end
      result_count.should eq 1
    end

    it 'removes note' do
      @crud_controller.perform_action({Notes::Options::ADD_NOTE => true, Notes::Options::TAG => 'to do'})
      @crud_controller.perform_action({Notes::Options::REMOVE_NOTE => true, Notes::Options::TAG => 'to do'})
      result_count = 0
      @db_controller.get_all_records.each do |record|
        result_count += 1
      end
      result_count.should eq 0
    end
  end
end
