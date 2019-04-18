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
        system "clear"
        puts "More Information on American Whiskeys"
        @index_url = @american_url
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="USA")
        print_list
        more_details_menu
      when "2"
        system "clear"
        puts "More Information on Japanese Whiskeys"
        @index_url = @japanese_url
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="Japan")
        print_list
        more_details_menu
      when "3"
        system "clear"
        puts "More Information on Irish Whiskeys"
        @index_url = @irish_url
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="Ireland")
        print_list
        more_details_menu
      when "exit"
         goodbye
      else
        call
      end
  end

  def print_list
    counter = 0
    @list.each {|w| puts "#{counter+=1}. #{w.name} By: #{w.distiller}"}
  end

  def more_details_menu
    puts "Enter The Number Of The Whiskey For More Info:"
    input = gets.strip.to_i
    @choice = @list[input-=1]
    if input < @list.size
      get_more_details(@choice.name)
    else
      print_list
      more_details_menu
  end
end

  def get_more_details(choice)
    selection = @list.select {|x| x.name == @choice.name}
    system "clear"
    puts "You've Made A GREAT Selection!\n"
    puts "You Chose #{@choice.name}"
    puts "#{selection.first.name} comes to us from #{selection.first.distiller}\n"
    puts "#{selection.first.name} has an ABV of #{selection.first.alc_content}\n"
    puts "#{selection.first.name} goes for a BARGAIN price of: #{selection.first.price}\n"
    puts "#{selection.first.text}".strip
    puts "More Information can be obtained here: #{selection.first.url}\n"
    stay_or_go
  end

  def stay_or_go
    puts "Would You Like To Play Again?\n"
    puts "Type 'yes' to continue or 'exit' to leave\n"
    input = gets
    case input.strip.to_s
    when "yes"
        system "clear"
        list_country_options
        menu
    when "exit"
      system "clear"
      goodbye
    else
      system "clear"
      stay_or_go
      end

end

  def goodbye
    puts "Thank You For Playing WhiskeyFinder!"
  end

  def country_urls
    @american_url = "https://www.masterofmalt.com/country/american-whiskey/"
    @japanese_url = "https://www.masterofmalt.com/country/japanese-whiskey/"
    @irish_url = "https://www.masterofmalt.com/country/irish-whiskey/"
  end

end
