require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'pry'

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").to_s.delete("</td>")
    return email.to_s
end

puts get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")
puts get_townhall_email("http://annuaire-des-mairies.com/67/aschbach.html")