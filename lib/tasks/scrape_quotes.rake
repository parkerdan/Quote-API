desc "Scrape Quotes"
task :scrape_quotes => :environment do
  require 'open-uri'


  (1..100).each do |n|

    url = "https://www.goodreads.com/quotes/tag/philosophy?page=#{n}"
    doc = Nokogiri::HTML(open(url))

    doc.css("div.quoteDetails").css("div.quoteText").text.split("\n")[1].strip!.gsub!('“',"").gsub!('”',"")

    doc.css("div.quoteDetails").each do |q|

      @quote = q.css("div.quoteText").text.split("\n")[1].strip!.gsub!('“',"").gsub!('”',"")
      @author = q.css("a.authorOrTitle").first.text

      encoding_options = {
      :undef             => :replace,  # Replace anything not defined in ASCII
      :replace           => "",        # Use a blank for those replacements
      }

      @save_this = @quote.encode(Encoding.find('ASCII'), encoding_options)

      if @quote.length < 100
        Quote.create(body: @save_this, author: @author, pirate_speak: TalkLikeAPirate.translate(@save_this))
        puts "saved quote"
      end
    end
  end

end
