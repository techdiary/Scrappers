require 'mechanize'

class Scrapper
  attr_accessor :parse_page, :agent

  def initialize
    @agent = Mechanize.new
    @parse_page = agent.get("http://google.com")
  end

  def google_form
    form_page = @parse_page.form('f') #Accessing form
    form_page.q = 'ruby mechanize'    #access input fields  as accessors on the object
    page = @agent.submit(form_page, form_page.buttons.first)
  end

  scrapper = Scrapper.new
  # pp scrapper.parse_page
  scrapper.google_form
  pp scrapper.parse_page

  #Submiting form

end
