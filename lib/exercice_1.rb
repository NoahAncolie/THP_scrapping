require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'pry'

def scraper
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
  resultat = Array.new

  20.times do |i|
    currencie = "/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i + 1}]/td[3]/div"
    price = "/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i + 1}]/td[5]/div/a/span"
    resultat[i] = {page.xpath(currencie).to_s.delete("</div>class=\" ") => page.xpath(price).to_s.delete("</span>$,").to_f}
  end
  return resultat
end

def perform
  puts scraper
end

perform

## SAMPLE DE XPATH
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]/div           ==> BTC
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/div/a/span    ==> btcPRIX
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[3]/div           ==> ETH
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[21]/td[3]/div          ==> ATOM
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[22]/td[3]/div          ==> LINK
# /html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[5]/div/a/span    ==> ethPRIX


## CODE DE JEREMY
# def scrapping
#     #connection a l'URL
#     page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all"))
  
#     #Sortir le nom des monnaies dans un array
#     crypto_name = page.xpath('//td[contains(@class,"symbol")]')
#     crypto_name_array = crypto_name.collect(&:text)

#     #sortir la value des monnaies dans un array
#     crypto_price = page.xpath('//td[contains(@class,"price")]')
#     crypto_price_array = crypto_price.collect(&:text)
  
#     #Concaténer les 2 arrays
#     data = Hash[crypto_name_array.zip crypto_price_array]
#     final_data = data.map {|key, value| puts "#{key} => #{value.delete("$,").to_f}"}
# end 
  
# def perform 
#     scrapping
# end
  
# perform
