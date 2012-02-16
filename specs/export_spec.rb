describe 'export' do
  describe 'console export' do
    it 'renders properly single line output'do
      console_export = Notes::ConsoleExport.new
      notes_to_be_exported =  [{ Notes::Options::TOKEN.to_s => '293603118701', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'martoooO!', Notes::Options::DUE_DATE.to_s => '20.02.2012'}]
      console_export.export_notes(notes_to_be_exported).should eq <<EXPORT
+---------------------------------------------------------------------------------------------------------------------+
|         ID         |        TAG         |                        DESCRIPTION                         |   DUE DATE   |
+---------------------------------------------------------------------------------------------------------------------+
|    293603118701    |       martin       |                         martoooO!                          |  20.02.2012  |
+---------------------------------------------------------------------------------------------------------------------+
EXPORT
    end

    it 'renders properly complex output' do
      console_export = Notes::ConsoleExport.new
      notes_to_be_exported =  [{ Notes::Options::TOKEN.to_s => '293603118701', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'martoooO!', Notes::Options::DUE_DATE.to_s => '20.02.2012'}]
      notes_to_be_exported <<  ({Notes::Options::TOKEN.to_s => '-936439782034', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'hellp', Notes::Options::DUE_DATE.to_s => '17.02.2012'})
      notes_to_be_exported << ({Notes::Options::TOKEN.to_s => '-591934493852', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'ruby rubira', Notes::Options::DUE_DATE.to_s => '17.02.2012'})
      console_export.export_notes(notes_to_be_exported).should eq <<EXPORT
+---------------------------------------------------------------------------------------------------------------------+
|         ID         |        TAG         |                        DESCRIPTION                         |   DUE DATE   |
+---------------------------------------------------------------------------------------------------------------------+
|    293603118701    |       martin       |                         martoooO!                          |  20.02.2012  |
|   -936439782034    |       martin       |                           hellp                            |  17.02.2012  |
|   -591934493852    |       martin       |                        ruby rubira                         |  17.02.2012  |
+---------------------------------------------------------------------------------------------------------------------+
EXPORT
    end
  end

  describe 'html export' do
    after do
      File.delete "./out.html"
    end
    it 'renders properly single line output' do
      html_export = Notes::HtmlExport.new './out.html'
      notes_to_be_exported =  [{ Notes::Options::TOKEN.to_s => '293603118701', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'martoooO!', Notes::Options::DUE_DATE.to_s => '20.02.2012'}]
      html_export.export_notes notes_to_be_exported
      IO.read("./out.html").should eq <<EXPORT
<!DOCTYPE html><html><head><meta http-equiv="content-type" content="text/html; charset=utf-8" /><title>Notes</title></head><body><table style="text-align: center;"><tr><td>ID</td><td>TAG</td><td>DESCRIPTION</td><td>DUE DATE</td></tr><tr><td>293603118701</td><td>martin</td><td>martoooO!</td><td>20.02.2012</td></tr></table style="text-align: center;"></body></html>
EXPORT
    end

    it 'renders complex output correctly' do
      html_export = Notes::HtmlExport.new './out.html'
      notes_to_be_exported =  [{ Notes::Options::TOKEN.to_s => '293603118701', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'martoooO!', Notes::Options::DUE_DATE.to_s => '20.02.2012'}]
      notes_to_be_exported <<  ({Notes::Options::TOKEN.to_s => '-936439782034', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'hellp', Notes::Options::DUE_DATE.to_s => '17.02.2012'})
      notes_to_be_exported << ({Notes::Options::TOKEN.to_s => '-591934493852', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'ruby rubira', Notes::Options::DUE_DATE.to_s => '17.02.2012'})
      html_export.export_notes notes_to_be_exported
      IO.read("./out.html").should eq <<EXPORT
<!DOCTYPE html><html><head><meta http-equiv="content-type" content="text/html; charset=utf-8" /><title>Notes</title></head><body><table style="text-align: center;"><tr><td>ID</td><td>TAG</td><td>DESCRIPTION</td><td>DUE DATE</td></tr><tr><td>293603118701</td><td>martin</td><td>martoooO!</td><td>20.02.2012</td></tr><tr><td>-936439782034</td><td>martin</td><td>hellp</td><td>17.02.2012</td></tr><tr><td>-591934493852</td><td>martin</td><td>ruby rubira</td><td>17.02.2012</td></tr></table style="text-align: center;"></body></html>
EXPORT
    end
  end

  describe 'csv export' do
    
   # after do
   #   File.delete './out.csv'
   # end

    it 'renders properly single line output' do
      csv_export = Notes::CsvExport.new './out.csv'
      notes_to_be_exported =  [{ Notes::Options::TOKEN.to_s => '293603118701', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'martoooO!', Notes::Options::DUE_DATE.to_s => '20.02.2012'}]
      csv_export.export_notes notes_to_be_exported
      IO.read("./out.csv").should eq <<EXPORT
293603118701, martin, "martoooO!", 20.02.2012
EXPORT
    end

    it 'renders complex output correctly' do
      csv_export = Notes::CsvExport.new './out.csv'
      notes_to_be_exported =  [{ Notes::Options::TOKEN.to_s => '293603118701', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'martoooO!', Notes::Options::DUE_DATE.to_s => '20.02.2012'}]
      notes_to_be_exported <<  ({Notes::Options::TOKEN.to_s => '-936439782034', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'hellp', Notes::Options::DUE_DATE.to_s => '17.02.2012'})
      notes_to_be_exported << ({Notes::Options::TOKEN.to_s => '-591934493852', Notes::Options::TAG.to_s => 'martin', Notes::Options::DESCRIPTION.to_s => 'ruby rubira', Notes::Options::DUE_DATE.to_s => '17.02.2012'})
      csv_export.export_notes notes_to_be_exported
      IO.read("./out.csv").should eq <<EXPORT
293603118701, martin, "martoooO!", 20.02.2012
-936439782034, martin, "hellp", 17.02.2012
-591934493852, martin, "ruby rubira", 17.02.2012
EXPORT
    end
  end
end
