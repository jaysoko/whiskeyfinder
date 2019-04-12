class WhiskeyFinder::Whiskey 
attr_accessor :name, :price, :distiller, :country, :alcohol_content



def self.find_whiskeys
  #find whiskeys from a certain country
  whiskeys = []
  
  whiskeys << self.scrape_whiskeys

end


def self.scrape_whiskeys
  #Go to MasterofMalt
  doc = Nokogiri::HTML(open("https://www.masterofmalt.com/country/american-whiskey/"))
  name = doc.search("h3 a").text
  distiller = doc.css("a.product-box-wide-distillery.gold").text
  price = doc.css("div.product-box-wide-price.gold").text
  alcohol_content = doc.css("div.product-box-wide-volume.gold").text
  binding.pry
end


  
  
  
end