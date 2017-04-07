require 'mechanize'

a = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}
a.cookie_jar.clear
# parse_page = a.get("https://amazon.com")
#
# amazon_form = parse_page.form('site-search')
# amazon_form.q = 'shoes'
# page = agent.submit(amazon_form)
#
# pp parse_page

a.get('https://amazon.com') do |page|
  search_reuslt = page.form_with(:name => 'site-search') do |search|
    search.q = 'Shoes'
  end.submit

  search_reuslt.links.each do |l|
    puts link.text
  end
end
