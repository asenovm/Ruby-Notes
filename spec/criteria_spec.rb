describe Notes::Criteria do
  describe 'initialization' do
    it 'correctly initializes fields' do
      criteria = Notes::Criteria.new 'name', 'value'
      criteria.name.should eq 'name'
      criteria.value.should eq 'value'
    end
  end

  describe 'to_hash' do
    it 'correctly creates corresponding hash' do
      criteria = Notes::Criteria.new 'name', 'value'
      criteria.to_hash.should eq ({'name' => 'value'})
    end
  end
end
