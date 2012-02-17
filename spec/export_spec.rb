describe 'export' do
  
  before do
    @test_hash = {}
    @test_hash[Notes::Options::TOKEN.to_s] = '1963438776275'
    @test_hash[Notes::Options::TAG.to_s] = 'unspecified'
    @test_hash[Notes::Options::DESCRIPTION.to_s] = 'asd'
    @test_hash[Notes::Options::DUE_DATE.to_s] = 'unspecified'
  end

  describe 'console export' do
    it 'renders properly single line output'do
      console_export = Notes::ConsoleExport.new
      console_export.export_notes([@test_hash]).should eq <<EXPORT
+----------------------------------------------------------------------------------------------------------------+
|       TOKEN        |           TAG           |                   DESCRIPTION                    |   DUE DATE   |
+----------------------------------------------------------------------------------------------------------------+
|   1963438776275    |       unspecified       |                       asd                        | unspecified  |
+----------------------------------------------------------------------------------------------------------------+
EXPORT
    end

    it 'renders properly complex output' do
      console_export = Notes::ConsoleExport.new
      console_export.export_notes([@test_hash,@test_hash,@test_hash]).should eq <<EXPORT
+----------------------------------------------------------------------------------------------------------------+
|       TOKEN        |           TAG           |                   DESCRIPTION                    |   DUE DATE   |
+----------------------------------------------------------------------------------------------------------------+
|   1963438776275    |       unspecified       |                       asd                        | unspecified  |
|   1963438776275    |       unspecified       |                       asd                        | unspecified  |
|   1963438776275    |       unspecified       |                       asd                        | unspecified  |
+----------------------------------------------------------------------------------------------------------------+
EXPORT
    end
  end

  describe 'html export' do
    after do
      File.delete "./out.html"
    end
    it 'renders properly single line output' do
      html_export = Notes::HtmlExport.new './out.html'
      html_export.export_notes [@test_hash]
      IO.read("./out.html").should eq <<EXPORT
<!DOCTYPE html><html><head><meta http-equiv="content-type" content="text/html; charset=utf-8" /><title>Notes</title></head><body><table style="text-align: center;"><tr><td>TOKEN</td><td>TAG</td><td>DESCRIPTION</td><td>DUE DATE</td></tr><tr><td>1963438776275</td><td>unspecified</td><td>asd</td><td>unspecified</td></tr></table style="text-align: center;"></body></html>
EXPORT
    end

    it 'renders complex output correctly' do
      html_export = Notes::HtmlExport.new './out.html'
      html_export.export_notes [@test_hash,@test_hash,@test_hash]
      IO.read("./out.html").should eq <<EXPORT
<!DOCTYPE html><html><head><meta http-equiv="content-type" content="text/html; charset=utf-8" /><title>Notes</title></head><body><table style="text-align: center;"><tr><td>TOKEN</td><td>TAG</td><td>DESCRIPTION</td><td>DUE DATE</td></tr><tr><td>1963438776275</td><td>unspecified</td><td>asd</td><td>unspecified</td></tr><tr><td>1963438776275</td><td>unspecified</td><td>asd</td><td>unspecified</td></tr><tr><td>1963438776275</td><td>unspecified</td><td>asd</td><td>unspecified</td></tr></table style="text-align: center;"></body></html>
EXPORT
    end
  end

  describe 'csv export' do
    
    after do
      File.delete './out.csv'
    end

    it 'renders properly single line output' do
      csv_export = Notes::CsvExport.new './out.csv'
      csv_export.export_notes [@test_hash]
      IO.read("./out.csv").should eq <<EXPORT
TOKEN, TAG, DESCRIPTION, DUE DATE
1963438776275, unspecified, "asd", unspecified
EXPORT
    end

    it 'renders complex output correctly' do
      csv_export = Notes::CsvExport.new './out.csv'
      csv_export.export_notes [@test_hash, @test_hash, @test_hash]
      IO.read("./out.csv").should eq <<EXPORT
TOKEN, TAG, DESCRIPTION, DUE DATE
1963438776275, unspecified, "asd", unspecified
1963438776275, unspecified, "asd", unspecified
1963438776275, unspecified, "asd", unspecified
EXPORT
    end
  end
end
