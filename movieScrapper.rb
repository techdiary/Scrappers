require 'mechanize'
require 'csv'

a = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }

# a .get('https://in.bookmyshow.com') do |page|
#   pp page
# end
class Scrapper

  def initialize
    a = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }
    @page = a.get('https://in.bookmyshow.com')
  end

  def get_movie_name
    item_container.css('div.detail').css('div.__name').css("a").children.map { |name| name.text  }.compact
  end

  def get_movie_genre
    item_container.css('div.detail').css('div.genre-list').css("a").children.map {|genre| genre.text}.compact
  end

  def get_movie_lang
    item_container.css('div.detail').css('div.languages').css("li").children.map { |lang| lang.text  }
  end


private
  def item_container
    @page.css("div.movie-card")
  end

  scrapper = Scrapper.new
  movie_array = []
  names = scrapper.get_movie_name
  genres = scrapper.get_movie_genre
  language = scrapper.get_movie_lang

 CSV.open('moviesDetail.csv', 'w') do |csv|
  (0...names.size).each do |index|
    puts "--- index: #{index +1 } -----------\t"
    puts "Name: #{names[index]}\n Genre: #{genres[index]}\n Languages: #{language[index]}"
    movie_array.push(names[index])
    movie_array.push(genres[index])
    movie_array.push(language[index])
    csv << movie_array
  end
end
    # CSV.open('moviesDetail.csv', 'w') do |csv|
    #   csv << movie_array
    # end
end
