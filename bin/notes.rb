#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'notes'

parser = OptionParser.new ARGV
parser.parse