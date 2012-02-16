describe Notes::Note do
  describe 'initialization' do

    it 'can be initialized with default args' do
      note = Notes::Note.new({})
    end

    it 'gets default values if none were specified ' do
      note = Notes::Note.new({})
      note.tag.should eq 'unspecified'
      note.description.should eq 'unspecified'
      note.due_date.should eq 'unspecified'
    end

    it 'correctly reads passed values' do
      note = Notes::Note.new({Notes::Options::TAG => 'to do', Notes::Options::DESCRIPTION => 'description', Notes::Options::DUE_DATE => '18.02.2012'})
      note.tag.should eq 'to do'
      note.description.should eq 'description'
      note.due_date.should eq '18.02.2012'
    end
  end

  describe 'to_hash' do
    it 'correctly creates corresponding hash when no parameters are specified' do
      note = Notes::Note.new({})
      note.to_hash.should eq ({Notes::Options::TAG.to_s => 'unspecified', Notes::Options::DESCRIPTION.to_s => 'unspecified', Notes::Options::DUE_DATE.to_s => 'unspecified', Notes::Options::TOKEN.to_s => note.get_token.to_s})
    end

    it 'correctly creates corresponding has when parameters are given' do
      note = Notes::Note.new({Notes::Options::TAG => 'to do', Notes::Options::DESCRIPTION => 'description', Notes::Options::DUE_DATE => '18.02.2012'})
      note.to_hash.should eq({Notes::Options::TAG.to_s => 'to do', Notes::Options::DESCRIPTION.to_s => 'description', Notes::Options::DUE_DATE.to_s => '18.02.2012', Notes::Options::TOKEN.to_s => note.get_token.to_s})
    end
  end
end
