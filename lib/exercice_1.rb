require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
resultat = Array.new

200.times do |i|
    currencie = "/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i + 1}]/td[3]/div"
    price = "/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i + 1}]/td[5]/div/a/span"
    resultat[i] = {page.xpath(currencie).to_s.delete("</div>class=\" ") => page.xpath(price).to_s.delete("</span>$,").to_f}
end


print resultat
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]/div           ==> BTC
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/div/a/span    ==> PRIX
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[3]/div           ==> ETH
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[21]/td[3]/div          ==> ATOM
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[22]/td[3]/div          ==> LINK
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[5]/div/a/span    ==> PRIX


