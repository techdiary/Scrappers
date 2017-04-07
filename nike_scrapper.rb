require 'mechanize'

agent = Mechanize.new

page = agent.get("http://www.nike.com/in/en_gb/")

puts page.title
#
# page.links.each do |link|
#   puts link.text
# end
men_shoes = agent.page.link_with(:text => 'MEN').click
puts men_shoes.title

shoes_page = men_shoes.link_with(:text => 'SHOES').click
puts shoes_page.title

shoeBox = shoes_page.css('div.grid-item-info')
shoeBox.each do |el|
  instance_text = el.text.gsub(/[[:space:]]/, "")
  puts instance_text
end
