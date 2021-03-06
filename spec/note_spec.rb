describe Notes::Note do
  before do
    @test_hash = {}
  end

  describe 'initialization' do
    it 'can be initialized with default args' do
      note = Notes::Note.new(@test_hash)
    end

    it 'gets default values if none were specified ' do
      note = Notes::Note.new(@test_hash)
      note.tag.should eq 'unspecified'
      note.description.should eq 'unspecified'
      note.due_date.should eq 'unspecified'
    end

    it 'correctly reads passed values' do
      @test_hash[Notes::Options::TAG] = ['to do']
      @test_hash[Notes::Options::DESCRIPTION] = 'description'
      @test_hash[Notes::Options::DUE_DATE] = '18.02.2012'
      note = Notes::Note.new @test_hash
      note.tag.should eq ['to do']
      note.description.should eq 'description'
      note.due_date.should eq '18.02.2012'
    end
  end

  describe 'to_hash' do
    it 'correctly creates corresponding hash when no parameters are specified' do
      note = Notes::Note.new(@test_hash)
      @test_hash[Notes::Options::TAG.to_s] = 'unspecified'
      @test_hash[Notes::Options::DESCRIPTION.to_s] = 'unspecified'
      @test_hash[Notes::Options::DUE_DATE.to_s] = 'unspecified'
      @test_hash[Notes::Options::TOKEN.to_s] = note.get_token.to_s
      note.to_hash.should eq @test_hash
    end

    it 'correctly creates corresponding has when parameters are given' do
      @test_hash[Notes::Options::TAG] = ['to do']
      @test_hash[Notes::Options::DESCRIPTION] = 'description'
      @test_hash[Notes::Options::DUE_DATE] = '18.02.2012'
      note = Notes::Note.new @test_hash
      test_against_hash = {}
      test_against_hash[Notes::Options::TAG.to_s] = ['to do']
      test_against_hash[Notes::Options::DESCRIPTION.to_s] = 'description'
      test_against_hash[Notes::Options::DUE_DATE.to_s] = '18.02.2012'
      test_against_hash[Notes::Options::TOKEN.to_s] = note.get_token.to_s
      note.to_hash.should eq test_against_hash
    end
  end
end
