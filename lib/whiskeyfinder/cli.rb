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
    counter = 0
    case input
      when "1"
        puts "More Information on American Whiskeys"
        @index_url = @american_url
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="USA")
        @list.each {|w| puts "#{counter+=1}. #{w.name} By: #{w.distiller}"}
        more_details_menu
      when "2"
        puts "More Information on Japanese Whiskeys"
        @index_url = @japanese_url
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="Japan")
        @list.each {|w| puts "#{counter+=1}. #{w.name} By: #{w.distiller}"}
        more_details_menu
      when "3"
        puts "More Information on Irish Whiskeys"
        @index_url = @irish_url
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="Ireland")
        @list.each {|w| puts "#{counter+=1}. #{w.name} By: #{w.distiller}"}
        more_details_menu
      when "exit"
         goodbye
      end
  end

  def more_details_menu
    puts "Enter The Number Of The Whiskey For More Info:"
    input = gets.strip.to_i
    @choice = @list[input-=1]
    puts "You Chose #{@choice.name}"
    get_more_details(@choice.name)
  end

  def get_more_details(choice)
    selection = @list.select {|x| x.name == @choice.name}
    puts "You've Made A GREAT Selection!\n"
    puts "#{selection.first.name} comes to us from #{selection.first.distiller}\n"
    puts "#{selection.first.name} has an ABV of #{selection.first.alc_content}\n"
    puts "#{selection.first.name} goes for a BARGAIN price of: #{selection.first.price}\n"
    puts "#{selection.first.text}".strip
    puts "More Information can be obtained here: #{selection.first.url}\n"

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
