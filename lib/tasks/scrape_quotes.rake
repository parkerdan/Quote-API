desc "Scrape Quotes"
task :scrape_quotes => :environment do
  require 'open-uri'


  (1..213).each do |n|

    url = "http://www.values.com/inspirational-quotes?page=#{n}"
    doc = Nokogiri::HTML(open(url))

    doc.css("div.quote").each do |q|

      @quote = q.css("h6 a").text
      @author = q.css("p").text.partition("[")[0]

      if @quote.length < 100
        Quote.create(body: @quote, author: @author)
        puts "saved quote"
      end
    end
  end

end
