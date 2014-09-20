#!/usr/bin/ruby
# encoding : utf-8

require 'rubygems'
require 'RMagick'
include Magick

# arguments processing
if ARGV.empty?
  puts 'no arguments given'
  exit 
else
  img_name = ARGV[0]
  unless File.exists?(img_name)
    puts "no file named #{img_name}"
    exit 
  end
end

device = (ARGV.count > 1 ? ARGV[1] : 'iphone')
img = ImageList.new(img_name)

# only iOS 7.0 and above
sizes = [{
      idiom: 'iphone 4 portrait',
      name: 'Default@2x~iphone.png',
      orientation: 'portrait',
      width: 320,
      height: 480,
      scale: 2},
      {
      idiom: 'iphone 5 portrait',
      name: 'Default-568h@2x~iphone.png',
      orientation: 'portrait',
      width: 320,
      height: 568,
      scale: 2},
      {
      idiom: 'ipad 1/2 portrait',
      name: 'Default-Portrait~ipad.png',
      orientation: 'portrait',
      width: 768,
      height: 1024,
      scale: 1},
      {
      idiom: 'ipad 1/2 landscape',
      name: 'Default-Landscape~ipad.png',
      orientation: 'landscape',
      width: 1024,
      height: 768,
      scale: 1},
      {
      idiom: 'ipad 3/4/Air portrait',
      name: 'Default-Portrait@2x~ipad.png',
      orientation: 'portrait',
      width: 768,
      height: 1024,
      scale: 2},
      {
      idiom: 'ipad 3/4/Air landscape',
      name: 'Default-Landscape@2x~ipad.png',
      orientation: 'landscape',
      width: 1024,
      height: 768,
      scale: 2}]

def log(width, height, scale, filename)
  s = "#{width/scale}x#{height/scale}"
  s.insert(0, ' '*(9 - s.length))
  f = "#{scale}x"
  fs = "#{width}x#{height}"
  fs.insert(0, ' '*(9 - fs.length))
  puts "#{s}(#{f}) -> #{fs}: #{filename}"
end

`rm screens/*.png` unless Dir['screens/*.png'].empty?
sizes.each do |s|
  if device == 'universal' || s[:idiom].start_with?(device)
    width = s[:scale]*s[:width]
    height = s[:scale]*s[:height]
    scaled_img = img.resize_to_fill(width, height)
    filename = 'screens/' + s[:name]
    log(width, height, s[:scale], filename)
    scaled_img.write(filename)
  end
end