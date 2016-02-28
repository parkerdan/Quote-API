require 'yodaspeak'
desc "Convert Yoda Speak"
task :get_yoda_speak => :environment do
    Yodaspeak.credentials("RRb2JvmFDDmshk5CcwfifvzeIBZUp1v3utLjsnnjyQL5G6C5Fz")

    @needs_convert = Quote.where(yoda_speak: "")
    @needs_convert.each do |q|
      q.yoda_speak = Yodaspeak.speak(q.body).body
      q.save
      puts "saved"
    end

end
