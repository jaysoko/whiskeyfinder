#!/usr/bin/env ruby

class WhiskeyFinder::Scraper

  def initialize(index_url)
    @index_url=index_url
  end

  def make_whiskey
  @whiskeys = []
  @doc = Nokogiri::HTML(open(@index_url))
  @products = @doc.css('div.boxBgr.product-box-wide.h-gutter.js-product-box-wide')
  @products.each do |w|
    whiskey = WhiskeyFinder::Whiskey.new(w.search("h3 a").text)
    whiskey.distiller=w.css("a.product-box-wide-distillery.gold").text
    whiskey.price=w.css("div.product-box-wide-price.gold").text
    whiskey.text=w.search("p").text
    whiskey.alc_content=w.css("div.product-box-wide-volume.gold").text
    whiskey.url=w.search("h3 a").attr('href').value
    whiskey.country=@country
    @whiskeys << whiskey
    end
    @whiskeys
  end

end
  #products = doc.css('div.boxBgr.product-box-wide.h-gutter.js-product-box-wide')
  #    products.each do |whiskey|
  #      whiskeys << {
  #        name: whiskey.search("h3 a").text,
  #        url: whiskey.search("h3 a").attr('href').value,
  #        alc_content: whiskey.css("div.product-box-wide-volume.gold").text,
  #        price: whiskey.css("div.product-box-wide-price.gold").text,
  #        distiller: whiskey.css("a.product-box-wide-distillery.gold").text,
  #        country: @country,
  #        text: whiskey.search("p").text }
