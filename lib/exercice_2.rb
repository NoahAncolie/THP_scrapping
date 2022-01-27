require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'pry'



def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").to_s.delete("</td>")
    name = page.xpath("/html/body/div/main/section[1]/div/div/div/h1").to_s.delete('</h1> -0123456789')
    return {name.to_sym => email.to_s}
end

def give_row_list(row)
  result = Array.new()
  list_mairies = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  62.times do |i|
    url_uniq = list_mairies.xpath("//td[#{row}]/p/a[#{i+ 1}]/@href").to_s
    result[i] = get_townhall_email("https://www.annuaire-des-mairies.com#{url_uniq[1..-1]}")
  end
  return result
end

def perform
  puts give_col_list(1) + give_col_list(2) + give_col_list(3)
end

perform

#list_mairies = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
## list_mairies = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
#print list_mairies.xpath("//td[2]/p/a[1]/@href").to_s


#puts get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")
#puts get_townhall_email("http://annuaire-des-mairies.com/67/aschbach.html")
