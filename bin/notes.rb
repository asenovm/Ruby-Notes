#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'notes'
module Notes
  parser = Options::OptionParser.new ARGV
  parser.parse
end
