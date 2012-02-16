describe 'works with db' do

  before do
    @db_controller = Notes::DatabaseController.new 'spec'
  end

  after do
    @db_controller.remove_all
  end

  it 'can add and retrieve notes successfully' do
    note = Notes::Note.new({Notes::Options::TAG => 'to do', Notes::Options::DESCRIPTION => 'description', Notes::Options::DUE_DATE => '16.02.2012'})
    @db_controller.insert note
    query_result = @db_controller.find([Notes::Criteria.new(Notes::Options::TAG.to_s, 'to do'), Notes::Criteria.new(Notes::Options::DESCRIPTION.to_s, 'description'), Notes::Criteria.new(Notes::Options::DUE_DATE.to_s, '16.02.2012')])
    result_length = 0
    query_result.each do |result|
      result_length += 1
    end
    result_length.should eq 1
  end
end
