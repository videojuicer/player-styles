#!/usr/bin/env ruby
# A short script to compose the styles from the index.json

require 'rubygems'
require 'fileutils'
require 'JSON'

#  Read index.json
json_raw = File.open(File.join(File.dirname(__FILE__), "index.json")).read
json = JSON.parse(json_raw.to_s)

# Get stylesheets and begin concating
all_styles = []

stylesheets = json["stylesheets"]
stylesheets.each do |path|
  full_path = File.join(File.dirname(__FILE__), path)
  stylesheet = File.open(full_path).read
  
  all_styles << stylesheet
end

puts "Generated styles from #{stylesheets.inspect}"
puts "Writing to ./build.css"

concat_styles = all_styles.join("\n\r\n\r")
build = File.open(File.join(File.dirname(__FILE__), "build.css"), "w") {|f| f.write concat_styles }

puts "Done."