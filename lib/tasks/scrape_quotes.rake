desc "Scrape Quotes"
task :scrape_quotes => :environment do
  require 'open-uri'


  (1..100).each do |n|

    url = "https://www.goodreads.com/quotes/tag/funny?page=#{n}"
    doc = Nokogiri::HTML(open(url))

    doc.css("div.quoteDetails").css("div.quoteText").text.split("\n")[1].strip!.gsub!('“',"").gsub!('”',"")

    doc.css("div.quoteDetails").each do |q|

      @quote = q.css("div.quoteText").text.split("\n")[1].strip!.gsub!('“',"").gsub!('”',"")
      @author = q.css("a.authorOrTitle").first.text


      if @quote.length < 100
        Quote.create(body: @quote, author: @author, pirate_speak: TalkLikeAPirate.translate(@quote))
        puts "saved quote"
      end
    end
  end

end
