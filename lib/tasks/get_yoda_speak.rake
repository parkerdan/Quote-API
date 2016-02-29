require 'yodaspeak'
desc "Convert Yoda Speak"
task :get_yoda_speak => :environment do
    @key = Rails.application.config.mashape_yoda_api_key
    Yodaspeak.credentials(@key)

    @needs_convert = Quote.where(yoda_speak: "")
    @needs_convert.each do |q|
      q.yoda_speak = Yodaspeak.speak(q.body).body
      q.save
      puts "saved"
    end

end
