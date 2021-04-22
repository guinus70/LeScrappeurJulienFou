require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_urls)
  towns = Array.new
  emails = Array.new
  townhall_urls.each do |i|
                        page = Nokogiri::HTML(URI.open(i))
  
                        emails << page.xpath('//div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  
                        towns << page.xpath('/html/body/div/main/section[1]/div/div/div/h1').text
                    end
  
  array_of_hashes = Array.new
  hash_emails = towns.zip(emails).to_h
  array_of_hashes = hash_emails.each_slice(1).map &:to_h

  return array_of_hashes

end 


def get_townhall_urls

 
  townhall_urls = Array.new
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))


  page.xpath('//p/a[@class="lientxt"]/@href').each do |a|
                                                      townhall_urls << "http://annuaire-des-mairies.com" + a.to_s.delete_prefix('.')
                                                    end
                                                    print townhall_urls
  return townhall_urls 


end 

def perform
  townhall_urls = get_townhall_urls
  array_of_hashes = get_townhall_email(townhall_urls)
  print array_of_hashes
end

perform

