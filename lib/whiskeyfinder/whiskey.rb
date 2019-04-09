class WhiskeyFinder::Whiskey 
attr_accessor :name, :price, :distiller, :country



def self.find_whiskeys
  #find whiskeys from a certain country
  whiskeys = []
  
  whiskeys << self.scrape_whiskeys

end


def self.scrape_whiskeys
  #Go to MasterofMalt
  doc = Nokogiri::HTML(open("https://www.masterofmalt.com/country/american-whiskey/"))
  binding.pry 
  
end


  
  
  
end