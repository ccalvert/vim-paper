require 'rubygems'
require 'imgkit'
require 'stringio'

height = 900
width = 1440
font_color = 'white'
font_size = 11
text_shadow_color = 'black'
background_color = '#0b4894'

css = <<EOD
    html {
      height: #{height}px;
      width: #{width}px;
      color: #{font_color};
      text-shadow: 0 1px 0 #{text_shadow_color};
    }
    body {
      font-size: #{font_size}pt;
      background: #{background_color};
      margin: 0;
    }
    table {
      height: 100%;
      padding: 30px 10px 10px 10px;
    }
    .header {display: none}
    tr.even { font-weight: normal; font-family: "Courier", "Menlo", monospace; font-size: 140%;}
    .middlecolumn, .absolute { font-size: 130%}
    tr.odd { font-family: "Helvetica Neue", sans-serif; font-size: 75%; vertical-align: top}
    tr:nth-child(16) {font-size: 180%; }
    .compass { font-weight: bold; font-size: 14pt; font-style: normal; font-variant: small-caps; font-family: "Optima"}
    tr:nth-child(17) .compass { -webkit-transform: rotate(-90deg); -moz-transform: rotate(-90deg);}
    tr:nth-child(17) .compass-right { -webkit-transform: rotate(90deg); -moz-transform: rotate(90deg);}
EOD

IMGKit.configure do |config|
  config.default_options = {
    :height => height,
    :width => width
  }
end

kit = IMGKit.new(File.read('/Users/ccalvert/Documents/source/vim-paper/temp.html'))
kit.stylesheets << StringIO.new(css)
file = kit.to_file('/Users/ccalvert/temp.png')
