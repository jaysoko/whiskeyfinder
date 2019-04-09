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
  name = doc.search("h3 a").first.text
  distiller = doc.css("#ContentPlaceHolder1_ctl00_AnchorDistillery").text
  price = doc.css("#ContentPlaceHolder1_ctl00_pricesWrapper").text
  alcohol_content = doc.css("#ContentPlaceHolder1_ctl00_VolumeAbv").text
  binding.pry
end


  
  
  
end