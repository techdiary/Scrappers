require 'mechanize'

class Scrapper

attr_accessor :parse_page, :menShoes, :menPage

  def initialize
    agent = Mechanize.new
    page = agent.get("http://www.nike.com/in/en_gb/")
    @parse_page ||= page
    @menPage = agent.page.link_with(:text => 'MEN').click
    @menShoes = menPage.link_with(:text => 'SHOES').click
  end

  def get_names
    item_container.css('div.product-name').css("p").children.map { |namme| namme.text  }.compact
  end

  def get_price
    item_container.css('div.product-price').css('span.local').children.map { |price| price.text  }.compact
  end

private
  def item_container
    menShoes.css("div.grid-item-info")
  end

  scrapper = Scrapper.new
  names = scrapper.get_names
  prices = scrapper.get_price

  (0...prices.size).each do |index|
    puts "-- index: #{index + 1} --"
    puts "Name: #{names[index]} | Price : #{prices[index]} "
  end
end
