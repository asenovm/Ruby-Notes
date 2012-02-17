#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'notes'
module Notes
  parser = Options::OptionParser.new ARGV
  crud_controller = CRUDController.new 'notes'
  crud_controller.perform_action parser.parse
end
