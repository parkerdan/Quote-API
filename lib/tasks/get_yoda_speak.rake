desc "Convert Yoda Speak"
task :get_yoda_speak => :environment do
    @key = Rails.application.config.mashape_yoda_api_key
    Yodaspeak.credentials(@key)

    encoding_options = {
    :undef             => :replace,  # Replace anything not defined in ASCII
    :replace           => "'",        # Use a blank for those replacements
    }

    @needs_convert = Quote.where(yoda_speak: "")
    @needs_convert.each do |q|
      @fix_unicode = q.body.encode(Encoding.find('ASCII'), encoding_options)
      q.yoda_speak = Yodaspeak.speak(@fix_unicode).body
      if q.yoda_speak.length < 110
        q.save
      end
    end

end
