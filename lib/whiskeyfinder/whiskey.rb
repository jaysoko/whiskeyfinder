class WhiskeyFinder::Whiskey
  
attr_accessor :name, :price, :distiller, :country, :alc_content, :url, :text
@@all = []

def initialize(name, price=nil, distiller=nil, country=nil, alc_content=nil, url=nil, text=nil)
  @name = name
  @price = price
  @distiller = distiller
  @country = country
  @alc_content = alc_content
  @url = url
  @text = text
  @@all << self
end

def self.all
  @@all
end

def self.find_whiskeys(index_url, country)
  #find whiskeys from a certain country
  @index_url = index_url
  @country = country
  whiskeys = []
  whiskeys << scrape_whiskeys(@index_url)
  whiskeys = whiskeys.flatten
end

def self.scrape_whiskeys(index_url)
  #Go to MasterofMalt
  @index_url = index_url
  whiskeys = WhiskeyFinder::Scraper.new(index_url).make_whiskey
end

end
