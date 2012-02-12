describe @note do

  before do
    @note = Note.new
  end

  describe 'initialization' do
    it 'can be initialized with no args' do
    end
  end

  describe'tags work properly' do
    it 'can have a tag' do
        @note.add_tag('todo')
    end
    
    it 'cannot have one tag multiple times' do
      @note.add_tag('multiple')
      @note.add_tag('multiple')
      @note.tags.count.should eq 1
    end

    it 'can have many tags' do
      @note.add_tag('to do')
      @note.add_tag('not to do')
      @note.add_tag('third tag')
      @note.tags.count.should eq 3
    end

    it 'can have tags removed' do
      @note.add_tag('to do')
      @note.remove_tag('to do')
      @note.tags.count.should eq 0
    end

    it 'can have unexisting tags removed' do
      @note.remove_tag('to do')
      @note.tags.count.should eq 0
    end
  end

  describe 'description' do
    it 'can be set a description' do
      @note.description = 'foobar'
    end

    it 'can have description removed' do
      @note.description = "foo bar"
      @note.remove_description
      @note.description.should eq nil
    end

    it 'can have description overriden' do
       @note.description = 'foobar'
       @note.description = 'new description'
       @note.description.should eq 'new description'
    end
  end

  describe 'to string output' do
    it 'can have tags exported to string' do
        @note.add_tag 'to do'
        @note.get_tags_as_string.should eq 'to do'
    end

    it 'can have multiple tags exported as string correctly' do
      @note.add_tag 'to do'
      @note.add_tag 'not to do'
      @note.add_tag 'something else'
      @note.get_tags_as_string.should eq 'to do, not to do, something else'
    end

    it 'adding and removing tags dont mess with tags output' do
      @note.add_tag 'to do'
      @note.add_tag 'to be done'
      @note.add_tag 'music'
      @note.add_tag 'something else'
      @note.remove_tag 'to do'
      @note.remove_tag ' music '
      @note.get_tags_as_string.should eq 'to be done, music, something else'
    end
  end

end
