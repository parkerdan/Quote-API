desc "Fix DB problems"
task :fix_db => :environment do

    encoding_options = {
    :undef             => :replace,  # Replace anything not defined in ASCII
    :replace           => "",        # Use a blank for those replacements
    }

    @needs_convert = Quote.where(yoda_speak: "")
    @needs_convert.each do |q|
      @fix_unicode = q.body.encode(Encoding.find('ASCII'), encoding_options)

      q.update(body: @fix_unicode, pirate_speak: TalkLikeAPirate.translate(@fix_unicode))
    end

end
