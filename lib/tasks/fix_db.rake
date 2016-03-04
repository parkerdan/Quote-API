desc "Fix DB problems"
task :fix_db => :environment do

    encoding_options = {
    :undef             => :replace,  # Replace anything not defined in ASCII
    :replace           => "",        # Use a blank for those replacements
    }

    # @needs_convert = Quote.where(yoda_speak: "")
    Quote.all.each do |q|

      @fix_unicode = q.author.encode(Encoding.find('ASCII'), encoding_options)

      if q.author.length != @fix_unicode.length
        puts "destroy"
        q.destroy
      end

    end

end
