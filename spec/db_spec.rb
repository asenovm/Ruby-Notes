describe 'works with db' do

  before do
    @db_controller = Notes::DatabaseController.new 'spec'
    @note = Notes::Note.new({Notes::Options::TAG => 'to do', Notes::Options::DESCRIPTION => 'description', Notes::Options::DUE_DATE => '16.02.2012'})
    @db_controller.create @note
  end

  after do
    @db_controller.remove_all
  end

  it 'can insert and find notes notes successfully' do
    search_criteria = [Notes::Criteria.new(Notes::Options::TAG.to_s, 'to do')]
    search_criteria << Notes::Criteria.new(Notes::Options::DESCRIPTION.to_s, 'description')
    search_criteria << Notes::Criteria.new(Notes::Options::DUE_DATE.to_s, '16.02.2012')
    query_result = @db_controller.find search_criteria
    result_length = 0
    query_result.each do |result|
      result_length += 1
    end
    result_length.should eq 1
  end

  it 'can update note' do
    inserted_note = @db_controller.find_one([Notes::Criteria.new(Notes::Options::TAG.to_s, 'to do')])
    update_criteria = [Notes::Criteria.new(Notes::Options::TAG.to_s, 'other')]
    @db_controller.update(Notes::Note.new({Notes::Options::ID => inserted_note[Notes::Options::TOKEN.to_s]}), update_criteria)
    query_result = @db_controller.find update_criteria
    result_length = 0
    query_result.each do |result|
      result_length +=1
    end
    result_length.should eq 1
  end

  it 'can remove note' do
    criterias = [Notes::Criteria.new(Notes::Options::TAG.to_s, 'to do')]
    @db_controller.remove criterias
    query_result = @db_controller.find criterias
    result_length = 0
    query_result.each do |result|
      result_length +=1
    end
    result_length.should eq 0
  end
end
