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
  whiskeys.flatten.collect {|w,v| self.new(w[:name],price=w[:price],distiller=w[:distiller],@country=country,alc_content=w[:alc_content],url=w[:url],text=w[:text]) }
end

def self.scrape_whiskeys(index_url)
  #Go to MasterofMalt
  @index_url = index_url
  whiskeys = []
  #doc = Nokogiri::HTML(open("https://www.masterofmalt.com/country/american-whiskey/"))
  doc = Nokogiri::HTML(open(@index_url))
  products = doc.css('div.boxBgr.product-box-wide.h-gutter.js-product-box-wide')
      products.each do |whiskey|
        whiskeys << {
          name: whiskey.search("h3 a").text,
          url: whiskey.search("h3 a").attr('href').value,
          alc_content: whiskey.css("div.product-box-wide-volume.gold").text,
          price: whiskey.css("div.product-box-wide-price.gold").text,
          distiller: whiskey.css("a.product-box-wide-distillery.gold").text,
          country: @country,
          text: whiskey.search("p").text }
      end
  whiskeys
  #Crib Notes
  #name = doc.search("h3 a").text
  #distiller = doc.css("a.product-box-wide-distillery.gold").text
  #price = doc.css("div.product-box-wide-price.gold").text
  #alcohol_content = doc.css("div.product-box-wide-volume.gold").text
end
end
