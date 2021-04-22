require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_deputes_data(deputes_url)
  icons = Array.new
  datas = Array.new
  array_of_hashes = Array.new
  names = ""
  deputes_url.each do |i|
                        
                        page = Nokogiri::HTML(URI.open(i))

                        names = page.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(" ")
                        first_name = names[1]
                        last_name = names[2]

                        hash_datas = {}
                        hash_datas["first_name"] = first_name
                        hash_datas["last_name"] =  last_name
                        hash_datas["email"] = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
                        array_of_hashes << hash_datas

                    end
 
  return array_of_hashes

end



def get_deputes_urls()
  deputes_url = Array.new
  page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/tableau"))


  page.xpath('/html/body/div/div[2]/div/div/section/div/article/div[3]').children.children.children.search('a').each do |a|
  deputes_url << "https://www2.assemblee-nationale.fr" + a.attr('href').to_s
  end
  return deputes_url                                                      
end   



def perform
  deputes_url = get_deputes_urls()
  array_of_hashes = get_deputes_data(deputes_url)
  print array_of_hashes
end  

perform
