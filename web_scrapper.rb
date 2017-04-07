# require 'httparty'
require 'nokogiri'
require 'mechanize'
# require 'json'
# require 'pry'
# require 'fastercsv'
# require 'open-uri'
#this is how we request the page we're going to scrape
# page = HTTParty.get("https://newyork.craigslist.org/search/pet?s=0""https://newyork.craigslist.org/search/pet?s=0")
mechanize = Mechanize.new
page =  mechanize.get("https://en.wikipedia.org/wiki/Main_Page")
# parse_page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Main_Page"))
# Pry.start(binding)
puts page.title
#EVERLY LINK OF GIVEN LINK
# page.links.each do |link|
#   puts link.text
# end

#SELECTED LINK
# random_article_page = mechanize.page.link_with(:text => 'Random article').click

# puts "Random article name: " +random_article_page.title
#Mechanized Nokogiri usage
# # DID YOU KNOW
# dykBox = page.css('div#mp-dyk ul li')
# dykBox.each do |el|
#   puts el.text + "\n \t"
# end
today_article = page.css('div#mp-tfa')
puts today_article.text
# puts dykBox.class
