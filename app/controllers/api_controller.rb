class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_api_key


  def convert_user_quote
    @apikey = Apikey.find_by key: request.headers["Quote-API-Key"]
    @apikey.increment!(:post_counter)
    Yodaspeak.credentials("RRb2JvmFDDmshk5CcwfifvzeIBZUp1v3utLjsnnjyQL5G6C5Fz")

    @user_quote = ActiveSupport::JSON.decode(request.raw_post)["quote"]
    @author = ActiveSupport::JSON.decode(request.raw_post)["author"]
    @yoda_speak = Yodaspeak.speak(@user_quote).body
    @pirate_speak = TalkLikeAPirate.translate(@user_quote)


    render :json => {
      :status => 200,
      :author => @author,
      :quote => @user_quote,
      :yoda_speak => @yoda_speak,
      :pirate_speak => @pirate_speak,
    }
  end

  def get_quote
    @apikey = Apikey.find_by key: request.headers["Quote-API-Key"]
    @apikey.increment!(:get_counter)
    # check_header
    # @var = request.raw_post
    # @var = TalkLikeAPirate.translate(ActiveSupport::JSON.decode(request.raw_post)["quote"])
    @quote = Quote.where("yoda_speak != ''").limit(1).order("RANDOM()").first
    render :json => {
      :status => 200,
      :quote => @quote.body,
      :yoda_speak => @quote.yoda_speak,
      :pirate_speak => @quote.pirate_speak,
    }
  end


  private

  def check_api_key
    if !Apikey.find_by key: request.headers["Quote-API-Key"]
      render :json => {
        :status => 498,
        :message => "Invalid Token",
      }
    end
  end

end
# request.headers["Author"]
# ActiveSupport::JSON.decode()
# curl -H "Content-Type: application/json" -X GET -d '{"quote":"my quote"}' http://localhost:3000/api/quote
