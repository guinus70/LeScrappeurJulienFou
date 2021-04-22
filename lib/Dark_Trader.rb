


def crypto_scrapper

  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  crypto_name = Array.new
  crypto_price = Array.new
  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div').each do |div|
    crypto_name << div.text
  end
  
  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a').each do |a|
    crypto_price << a.text.delete_prefix('$')
    
  end  

  array_of_hashes = Array.new
  crypto_price = crypto_price.map{ |x| x.gsub(/[\s,]/ , "") }
  hash_crypto = crypto_name.zip(crypto_price.map{|x| x.to_f}).to_h
  array_of_hashes = hash_crypto.each_slice(1).map &:to_h
  
  return array_of_hashes
end 



def perform
  array_of_hashes = crypto_scrapper
  print array_of_hashes
end

perform
