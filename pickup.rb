require 'nokogiri'

doc = Nokogiri::HTML(open('index.html'))
doc.css('.link ul li a').each do |a|
  puts "* [#{a.text}](#{a[:href]})"
end
