require 'mechanize'

a = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}
# parse_page = agent.get("http://google.com")
#
# google_form = parse_page.form('f')
# google_form.q = 'ruby mechanize'
# page = agent.submit(google_form)

# pp parse_page

a.get('http://google.com') do |page|
  search_reuslt = page.form_with(:name => 'f') do |search|
    search.q = 'Metallica'
  end.submit

  search_reuslt.links.each do |link|
    puts link.text
  end
end
