class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def convert_to_pirate_speak
    check_header
    # @var = request.raw_post
    @var = TalkLikeAPirate.translate(ActiveSupport::JSON.decode(request.raw_post)["quote"])
    #
    # render :new

    render :json => {
      :status => 200,
      :body => @var,
      :author => @author,
    }
  end
  private

  def check_authorization
    
  end

  def check_header
    if request.headers["Author"]
      @author = TalkLikeAPirate.translate(request.headers["Author"])
    else
      @author = false
    end
  end

end
# request.headers["Author"]
# ActiveSupport::JSON.decode()
# curl -H "Content-Type: application/json" -X GET -d '{"quote":"my quote"}' http://localhost:3000/api/quote
