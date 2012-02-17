Gem::Specification.new do |s|
  s.name = 'ruby-notes'
  s.version = '1.0.0'
  s.date = '2012-02-17'
  s.summary = 'console line tool that let you easily keep reminders/notes.'
  s.description = 'Ruby notes is a console lne tool that let you keep reminders/notes and afterwards search within them and export the result to various formats.'
  s.authors = ['Martin Asenov']
  s.email = 'asenov.m@gmail.com'
  s.files = [ 'bin/notes.rb',
              'lib/notes.rb', 
              'lib/notes/controller/crud_controller.rb',
              'lib/notes/model/db_manager.rb', 
              'lib/notes/controller/option_parser.rb', 
              'lib/notes/export/base_export.rb',
              'lib/notes/export/console_export.rb',
              'lib/notes/export/csv_export.rb',
              'lib/notes/export/html_export.rb',
              'lib/notes/model/note.rb',
              'lib/notes/model/criteria.rb',
              'lib/notes/options/add_note.rb',
              'lib/notes/options/all.rb',
              'lib/notes/options/base_option.rb',
              'lib/notes/options/console.rb',
              'lib/notes/options/csv.rb',
              'lib/notes/options/current.rb',
              'lib/notes/options/description.rb',
              'lib/notes/options/due_date.rb',
              'lib/notes/options/find_note.rb',
              'lib/notes/options/html.rb',
              'lib/notes/options/option_consts.rb',
              'lib/notes/options/options.rb',
              'lib/notes/options/remove_note.rb',
              'lib/notes/options/tag.rb',
              'lib/notes/options/token.rb',
              'lib/notes/options/update_note.rb' ]
  s.homepage = 'https://github.com/asenovm/Ruby-Notes'
  s.test_files = ['spec/criteria_spec.rb',
                  'spec/crud_spec.rb',
                  'spec/db_spec.rb',
                  'spec/export_spec.rb',
                  'spec/note_spec.rb',
                  'spec/options_spec.rb']
end
