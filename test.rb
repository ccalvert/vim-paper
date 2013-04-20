require 'rubygems'
require 'imgkit'

IMGKit.configure do |config|
  config.default_options = {
    :height => 900,
    :width => 1440
  }
end

kit = IMGKit.new(File.new('/Users/ccalvert/temp.html'))
file = kit.to_file('/Users/ccalvert/temp.png')
