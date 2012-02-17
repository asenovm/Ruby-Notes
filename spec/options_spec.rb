describe 'Options' do
  describe 'initialization' do
    it 'returns name, description and type correctly' do
      add_note = Notes::Options::AddNote.new
      add_note.name.should eq Notes::Options::ADD_NOTE
      add_note.description.should eq 'Add a new note with the parameters specified'
      add_note.options.should eq ({:type => nil, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::Console.new
      add_note.name.should eq Notes::Options::CONSOLE_EXPORT
      add_note.description.should eq 'The result of this operation(if any) will be printed in the console'
      add_note.options.should eq ({:type => nil, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::CSV.new
      add_note.name.should eq Notes::Options::CSV_EXPORT
      add_note.description.should eq 'The result of this operation(if any) will be printed in the file specified in csv format.'
      add_note.options.should eq ({:type => String, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::Current.new
      add_note.name.should eq Notes::Options::CURRENT
      add_note.description.should eq 'Specified action will only be applied to notes with due date that is after or coincides with the current day.'
      add_note.options.should eq ({:type => nil, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::Description.new
      add_note.name.should eq Notes::Options::DESCRIPTION
      add_note.description.should eq 'Specify the description for the note'
      add_note.options.should eq ({:type => String, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::DueDate.new
      add_note.name.should eq Notes::Options::DUE_DATE
      add_note.description.should eq 'Specify the due date for the note'
      add_note.options.should eq ({:type => String, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::FindNote.new
      add_note.name.should eq Notes::Options::FIND_NOTE
      add_note.description.should eq 'Finds the note specified.'
      add_note.options.should eq ({:type => nil, :multi => false})
    end
    it 'returns name, description and type correctly' do
      add_note = Notes::Options::Html.new
      add_note.name.should eq Notes::Options::HTML_EXPORT
      add_note.description.should eq 'The result of this operation(if any) will be saved into the file given in html format'
      add_note.options.should eq ({:type => String, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::Token.new
      add_note.name.should eq Notes::Options::TOKEN
      add_note.description.should eq 'Specified action is only applied to the note with the id given.'
      add_note.options.should eq ({:type => String, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::RemoveNote.new
      add_note.name.should eq Notes::Options::REMOVE_NOTE
      add_note.description.should eq 'Removes the specified note'
      add_note.options.should eq ({:type => nil, :multi => false})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::Tag.new
      add_note.name.should eq Notes::Options::TAG
      add_note.description.should eq 'Specified action only takes effect on notes with the tag given.'
      add_note.options.should eq ({:type => String, :multi => true})
    end

    it 'returns name, description and type correctly' do
      add_note = Notes::Options::UpdateNote.new
      add_note.name.should eq Notes::Options::UPDATE_NOTE
      add_note.description.should eq 'Update the note given'
      add_note.options.should eq ({:type => nil, :multi => false})
    end
  end
end
