#!/usr/bin/env ruby
class WhiskeyFinder::CLI
  #include WhiskeyFinder::ClassMethods

  def call
    list_country_options
    country_urls
    menu
  end

  def list_country_options
    puts "International Whiskey Finder"
    puts "1. USA\n2. Japan\n3. Ireland\n4. Type 'exit' to leave"
  end

  def menu
    puts "Enter The Number Of The Country You Wish To Research:"
    input = gets.strip
    case input
      when "1"
        puts "More Info on American Whiskeys"
        @american_url = "https://www.masterofmalt.com/country/american-whiskey/"
        @index_url = @american_url
        @american_list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="USA")
        #@american_list.each {|w| puts "#{w[:name]}" }
        @american_list.flatten.map { |w| puts "#{w[:name]}" }
      when "2"
        puts "More Info on Japanese Whiskeys"
      when "3"
        puts "More Info on Irish Whiskeys"
      when "exit"
         goodbye
      end
  end

  def goodbye
    puts "Thank You For Playing"
  end

  def country_urls
    @american_url = "https://www.masterofmalt.com/country/american-whiskey/"
    @japanese_url = "https://www.masterofmalt.com/country/japanese-whiskey/"
    @irish_url = "https://www.masterofmalt.com/country/irish-whiskey/"
  end

end
